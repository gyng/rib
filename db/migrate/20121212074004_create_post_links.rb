class CreatePostLinks < ActiveRecord::Migration
  def change
    create_table :post_links do |t|
      t.integer :post_from
      t.integer :post_to

      t.timestamps
    end
  end
end
