class AddLastPostAtToDiscussion < ActiveRecord::Migration
  def change
    add_column :discussions, :last_post_at, :integer
  end

  def down
    remove_column :discussions, :last_post_at
  end
end
