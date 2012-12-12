class PostLink < ActiveRecord::Base
  attr_accessible :post_from, :post_to

  belongs_to :post
end
