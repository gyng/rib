class Discussion < ActiveRecord::Base
  attr_accessible :posts, :posts_attributes, :discussion, :board, :board_id, :last_post_at
  belongs_to :board
  has_many :posts, dependent: :destroy
  accepts_nested_attributes_for :posts
  validate :posts_count_within_bounds

  def posts_count_within_bounds
    return if posts.blank?
    if posts.size > APP_CONFIG['max_posts_in_discussion']
      errors.add(:base, "Post limit reached. (#{APP_CONFIG['max_posts_in_discussion']})")
    end
  end
end
