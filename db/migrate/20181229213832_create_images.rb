class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :url
      t.integer :order_index
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
