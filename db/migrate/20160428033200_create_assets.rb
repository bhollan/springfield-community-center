class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :name
      t.integer :kind
      t.integer :max_quantity

      t.timestamps null: false
    end
    add_index :assets, :name
  end
end
