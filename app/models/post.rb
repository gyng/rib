class Post < ActiveRecord::Base
  include ActionView::Helpers::UrlHelper # for link_to helper in parse_quoted_posts

  attr_accessible(
    :text,
    :title,
    :content,
    :discussion,
    :discussion_id,
    :flagged,
    :original_file_name
  )
  belongs_to :discussion
  belongs_to :board
  after_create :update_discussion_last_post_at
  after_destroy :destroy_empty_discussion

  # Paperclip
  has_attached_file :content, styles: { thumb: "350>x350>" }
  validates_attachment_size :content, less_than: 4.megabytes
  before_content_post_process :rename_content

  validate :has_text_or_content
  validate :discussion, presence: true

  def rename_content
    extension = File.extname(content.path).downcase
    #name = Digest::MD5.file(content.path).hexdigest
    self.original_file_name = content.original_filename
    name = Time.now.to_i.to_s
    filename = name + extension
    self.content.instance_write :file_name, filename
  end

  def update_discussion_last_post_at
    discussion.last_post_at = Time.now.to_i
    discussion.save
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
