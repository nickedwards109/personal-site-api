require 'rails_helper'

describe "Projects API" do
  before(:all) do
    # Start the tests with a clean database
    SentenceGroup.destroy_all
    Link.destroy_all
    Image.destroy_all
    Paragraph.destroy_all
    Project.destroy_all

    @project_1 = create(:project)
      @images_1 = create_list(:image, 2, project: @project_1)
      @paragraph_1 = create(:paragraph, project: @project_1)
        @sentence_groups_1 = create_list(:sentence_group, 2, paragraph: @paragraph_1)
        @links_1 = create_list(:link, 2, paragraph: @paragraph_1)
      @paragraph_1_another = create(:paragraph, project: @project_1)
        @sentence_groups_1_another = create_list(:sentence_group, 2, paragraph: @paragraph_1_another)
        @links_1_another = create_list(:link, 2, paragraph: @paragraph_1_another)

    @project_2 = create(:project)
      @images_2 = create_list(:image, 2, project: @project_2)
      @paragraph_2 = create(:paragraph, project: @project_2)
        @sentence_groups_2 = create_list(:sentence_group, 2, paragraph: @paragraph_2)
        @links_2 = create_list(:link, 2, paragraph: @paragraph_2)
      @paragraph_2_another = create(:paragraph, project: @project_2)
        @sentence_groups_2_another = create_list(:sentence_group, 2, paragraph: @paragraph_2)
        @links_1_another = create_list(:link, 2, paragraph: @paragraph_2)
  end

  it "sends a collection of projects" do
    get '/api/v1/projects.json'

    expect(response).to be_successful

    projects = JSON.parse(response.body)
    expect(projects.count).to eq(2)

    project = projects.first

    expect(project).to have_key("title")
    expect(project["title"].class).to eq(String)

    expect(project).to have_key("images")
    expect(project["images"].count).to eq(2)
    expect(project["images"].class).to eq(Array)
    image = project["images"].first
    expect(image).to have_key("url")
    expect(image).to have_key("order_index")
    expect(image).to have_key("project_id")
    expect(image["url"].class).to eq(String)
    expect(image["order_index"].class).to eq(Integer)
    expect(image["project_id"].class).to eq(Integer)

    expect(project).to have_key("paragraphs")
    expect(project["paragraphs"].count).to eq(2)
    expect(project["paragraphs"].class).to eq(Array)
    paragraph = project["paragraphs"].first
    expect(paragraph).to have_key("order_index")
    expect(paragraph).to have_key("project_id")
    expect(paragraph["order_index"].class).to eq(Integer)
    expect(paragraph["project_id"].class).to eq(Integer)

    expect(paragraph).to have_key("sentence_groups")
    expect(paragraph["sentence_groups"].class).to eq(Array)
    expect(paragraph["sentence_groups"].count).to eq(2)
    sentence_group = paragraph["sentence_groups"].first
    expect(sentence_group).to have_key("copy")
    expect(sentence_group).to have_key("order_index")
    expect(sentence_group).to have_key("paragraph_id")
    expect(sentence_group["copy"].class).to eq(String)
    expect(sentence_group["order_index"].class).to eq(Integer)
    expect(sentence_group["paragraph_id"].class).to eq(Integer)

    expect(paragraph).to have_key("links")
    expect(paragraph["links"].class).to eq(Array)
    expect(paragraph["links"].count).to eq(2)
    link = paragraph["links"].first
    expect(link).to have_key("url")
    expect(link).to have_key("order_index")
    expect(link).to have_key("paragraph_id")
    expect(link["url"].class).to eq(String)
    expect(link["order_index"].class).to eq(Integer)
    expect(link["paragraph_id"].class).to eq(Integer)
  end
end
