class Discussion < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :posts, dependent: :destroy
end
