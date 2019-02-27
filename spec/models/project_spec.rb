require 'rails_helper'

RSpec.describe Project, type: :model do
  it "has a title, has several paragraphs, and has several images" do
    project = Project.create(
      title: "This is the Project title",
      alignment: "center",
      number_of_left_aligned_elements: 3
    )

    paragraphs = create_list(:paragraph, 2, project: project)
    images = create_list(:image, 2, project: project)

    expect(project).to be_valid
    expect(project.title).to eq("This is the Project title")
    expect(project.alignment).to eq("center")
    expect(project.number_of_left_aligned_elements).to eq(3)
    expect(project.paragraphs.count).to eq(2)
    expect(project.images.count).to eq(2)

    split_project = Project.create(
      title: "This is the Project title",
      alignment: "split_center",
      number_of_left_aligned_elements: 3
    )
    expect(split_project).to be_valid
    expect(split_project.alignment).to eq("split_center")
  end
end
