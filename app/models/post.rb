class Post < ActiveRecord::Base
  attr_accessible :text, :title
  attr_protected :discussion_id
  belongs_to :discussion

  # Paperclip
  has_attached_file :content#, styles: { thumb: "250x250#" }
end
