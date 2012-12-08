class Board < ActiveRecord::Base
  attr_accessible :title, :discussions_attributes
  has_many :discussions, dependent: :destroy
  has_many :posts, dependent: :destroy
  accepts_nested_attributes_for :discussions
  accepts_nested_attributes_for :posts
end
