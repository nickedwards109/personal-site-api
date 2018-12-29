require 'rails_helper'

RSpec.describe Project, type: :model do
  it "has a title, has several paragraphs, and has several images" do
    project = Project.create(title: "This is the Project title")

    paragraphs = create_list(:paragraph, 2, project: project)
    images = create_list(:image, 2, project: project)

    expect(project).to be_valid
    expect(project.paragraphs.count).to eq(2)
    expect(project.images.count).to eq(2)
  end
end
