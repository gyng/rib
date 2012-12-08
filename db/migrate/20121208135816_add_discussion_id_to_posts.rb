class AddDiscussionIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :discussion_id, :integer
  end

  def down
    remove_column :posts, :discussion_id
  end
end
