class Board < ActiveRecord::Base
  attr_accessible :title, :discussions_attributes, :short_form
  has_many :discussions, dependent: :destroy
  has_many :posts, dependent: :destroy
  accepts_nested_attributes_for :discussions
  accepts_nested_attributes_for :posts
  after_update :prune_old_discussions
  after_update :prune_aged_discussions if APP_CONFIG['prune_by_age']
  validate :discussions_count_within_bounds
  validates_presence_of :short_form

  def to_param
    "#{short_form.parameterize}"
  end

  def discussions_count_within_bounds
    return if discussions.blank?
    if discussions.count > APP_CONFIG['max_discussions_in_board']
      errors.add(:base, "Discussion limit reached. (#{APP_CONFIG['max_discussions_in_board']})")
    end
  end

  # By limit
  def prune_old_discussions
    while discussions.count > APP_CONFIG['max_discussions_in_board']
      discussions.first(order: 'last_post_at asc').destroy
    end
  end

  # By time
  def prune_aged_discussions
    return if discussions.blank?
    while ((Time.now - (d = discussions.first(order: 'created_at asc'))) > APP_CONFIG['max_discussions_age'])
      d.destroy
    end
  end
end
