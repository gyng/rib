class AddOriginalFileNameToPost < ActiveRecord::Migration
  def change
    add_column :posts, :original_file_name, :string
  end

  def down
    remove_column :posts, :original_file_name
  end
end
