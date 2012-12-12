class AddPostIdToPostLink < ActiveRecord::Migration
  def change
    add_column :post_links, :post_id, :integer
  end
end
