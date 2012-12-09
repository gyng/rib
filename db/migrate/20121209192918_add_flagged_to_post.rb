class AddFlaggedToPost < ActiveRecord::Migration
  def change
    add_column :posts, :flagged, :boolean, :default => false
  end

  def down
    remove_column :posts, :flagged
  end
end
