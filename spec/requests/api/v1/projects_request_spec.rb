require 'rails_helper'

describe "Projects API" do
  it "sends a collection of projects" do
    # Start the tests with a clean database
    Project.destroy_all

    project_1 = Project.create(title: "This is the first Project title")
    paragraphs = create_list(:paragraph, 2, project: project_1)
    images = create_list(:image, 2, project: project_1)

    project_2 = Project.create(title: "This is another Project title")
    paragraphs = create_list(:paragraph, 2, project: project_2)
    images = create_list(:image, 2, project: project_2)

    get '/api/v1/projects.json'

    expect(response).to be_successful

    projects = JSON.parse(response.body)
    expect(projects.count).to eq(2)

    project = projects.first

    expect(project).to have_key("title")
    expect(project["title"].class).to eq(String)

    expect(project).to have_key("paragraphs")
    expect(project["paragraphs"].class).to eq(Array)
    paragraph = project["paragraphs"].first
    expect(paragraph["copy"].class).to eq(String)
    expect(paragraph["order_index"].class).to eq(Integer)
    expect(paragraph["project_id"].class).to eq(Integer)

    expect(project).to have_key("images")
    expect(project["images"].class).to eq(Array)
    image = project["images"].first
    expect(image["url"].class).to eq(String)
    expect(image["order_index"].class).to eq(Integer)
    expect(image["project_id"].class).to eq(Integer)
  end
end
