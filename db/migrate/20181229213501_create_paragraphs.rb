class CreateParagraphs < ActiveRecord::Migration[5.2]
  def change
    create_table :paragraphs do |t|
      t.text :copy
      t.integer :order_index
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
