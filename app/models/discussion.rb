class Discussion < ActiveRecord::Base
  attr_accessible :posts, :posts_attributes, :discussion, :board, :board_id
  belongs_to :board
  has_many :posts, dependent: :destroy
  accepts_nested_attributes_for :posts
end
