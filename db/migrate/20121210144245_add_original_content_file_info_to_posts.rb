class AddOriginalContentFileInfoToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :content_width, :integer
    add_column :posts, :content_height, :integer
  end

  def down
    remove_column :posts, :content_width
    remove_column :posts, :content_height
  end
end
