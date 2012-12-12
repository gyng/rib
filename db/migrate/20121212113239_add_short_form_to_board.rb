class AddShortFormToBoard < ActiveRecord::Migration
  def change
    add_column :boards, :short_form, :string
  end

  def down
    remove_column :boards, :short_form
  end
end
