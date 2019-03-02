class RenameProjectToSection < ActiveRecord::Migration[5.2]
  def change
    rename_table :projects, :sections
    rename_column :paragraphs, :project_id, :section_id
    rename_column :images, :project_id, :section_id
  end
end
