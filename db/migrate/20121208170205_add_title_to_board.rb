class AddTitleToBoard < ActiveRecord::Migration
  def change
    add_column :boards, :title, :string
  end

  def down
    remove_column :boards, :title
  end
end
