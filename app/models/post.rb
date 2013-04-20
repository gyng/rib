class Post < ActiveRecord::Base
  attr_accessible(
    :text,
    :title,
    :content,
    :discussion,
    :discussion_id,
    :flagged,
    :content_width,
    :content_height,
    :content_file_size,
    :content_content_type
  )

  belongs_to :discussion
  belongs_to :board
  has_many :post_links, dependent: :destroy

  after_create :update_discussion_last_post_at
  after_update :update_discussion_last_post_at
  after_create :parse_post_links
  after_destroy :destroy_empty_discussion

  image_mime = APP_CONFIG['accepted_image_mimetypes']
  audio_mime = APP_CONFIG['accepted_audio_mimetypes']
  video_mime = APP_CONFIG['accepted_video_mimetypes']
  accepted_types = "^(#{audio_mime}|#{image_mime}|#{video_mime})$"

  # Paperclip
  has_attached_file :content, styles: { thumb: "350x350>" }
  validates_attachment_size :content, less_than: APP_CONFIG['max_content_size_mb'].megabytes
  validates_attachment_content_type :content, :content_type => /#{accepted_types}/, :message => "Invalid file type."
  before_content_post_process :allow_only_images # Only generate thumbnails for images
  before_content_post_process :save_original_file_information
  before_content_post_process :rename_content

  validate :has_text_or_content
  validate :discussion, presence: true
  validate :text, :length => { :maximum => APP_CONFIG['max_text_length'] }
  validate :title, :length => { :maximum => APP_CONFIG['max_title_length'] }

  def save_original_file_information
    if self.content_content_type =~ /#{@image_mime}/
      geo = Paperclip::Geometry.from_file(content.queued_for_write[:original])
      self.content_width = geo.width
      self.content_height = geo.height
    end
  end

  # Only generate thumbnails for images by returning false
  def allow_only_images
    if !(content.content_type =~ %r{^(image|(x-)?application)/(x-png|pjpeg|jpeg|jpg|png|gif)$})
      rename_content
      return false
    end
  end

  def rename_content
    extension = File.extname(content.path).downcase
    #name = Digest::MD5.file(content.path).hexdigest
    self.original_file_name = content.original_filename
    name = Time.now.to_f.to_s
    filename = name + extension
    self.content.instance_write :file_name, filename
  end

  def update_discussion_last_post_at
    self.discussion.last_post_at = Time.now.to_i
    self.discussion.save
  end

  def parse_post_links
    self.text.scan(/>>(\d+)/).each do |pid|
      if !(Post.find_by_id(pid)).nil?
        self.post_links.create(post_from: id, post_to: pid.first)
      end
    end
  end

  def has_text_or_content
    if !text? && !content?
      errors.add(:base, 'Post needs text or content.')
    end
  end

  def destroy_empty_discussion
    return if discussion.nil?
    discussion.destroy if discussion.posts.empty?
  end
end
