class Discussion < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :posts, :posts_attributes
  has_many :posts, dependent: :destroy
  accepts_nested_attributes_for :posts
end
