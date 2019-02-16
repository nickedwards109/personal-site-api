class CreateSentenceGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :sentence_groups do |t|
      t.text :copy
      t.integer :order_index
      t.references :paragraph, foreign_key: true

      t.timestamps
    end
  end
end
