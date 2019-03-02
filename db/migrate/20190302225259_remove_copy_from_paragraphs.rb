class RemoveCopyFromParagraphs < ActiveRecord::Migration[5.2]
  def change
    remove_column :paragraphs, :copy
  end
end
