class AddBoardIdToDiscussion < ActiveRecord::Migration
  def change
    add_column :discussions, :board_id, :integer
  end

  def down
    remove_column :discussions, :board_id
  end
end
