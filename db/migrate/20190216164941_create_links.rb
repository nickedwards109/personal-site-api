class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :url
      t.integer :order_index
      t.references :paragraph, foreign_key: true

      t.timestamps
    end
  end
end
