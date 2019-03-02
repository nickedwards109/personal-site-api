class AddPageIdToSections < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :page_id, :integer, foreign_key: true
  end
end
