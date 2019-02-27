class AddAlignmentToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :alignment, :integer, default: 0
    add_column :projects, :number_of_left_aligned_elements, :integer
  end
end
