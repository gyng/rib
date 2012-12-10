class Post < ActiveRecord::Base
  include ActionView::Helpers::UrlHelper # for link_to helper in parse_quoted_posts

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
  after_create :update_discussion_last_post_at
  after_destroy :destroy_empty_discussion

  # Paperclip
  has_attached_file :content, styles: { thumb: "350x350>" }
  validates_attachment_size :content, less_than: 4.megabytes
  before_content_post_process :save_original_file_information
  before_content_post_process :rename_content

  validate :has_text_or_content
  validate :discussion, presence: true

  def save_original_file_information
    geo = Paperclip::Geometry.from_file(content.queued_for_write[:original])
    self.content_width = geo.width
    self.content_height = geo.height
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
