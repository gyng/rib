class AddContentToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :content_file_name, :string
    add_column :posts, :content_content_type, :string
    add_column :posts, :content_file_size, :integer
  end

  def down
    remove_column :posts, :content_file_name
    remove_column :posts, :content_content_type
    remove_column :posts, :content_file_size
  end
end
