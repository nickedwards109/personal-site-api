require 'rails_helper'

describe "Pages API" do
  before(:all) do
    # Start the tests with a clean database
    SentenceGroup.destroy_all
    Link.destroy_all
    Image.destroy_all
    Paragraph.destroy_all
    Section.destroy_all
    Page.destroy_all

    @page_1 = create(:page)
      @section_1 = create(:section, page: @page_1)
        @images_1 = create_list(:image, 2, section: @section_1)
        @paragraph_1 = create(:paragraph, section: @section_1)
          @sentence_groups_1 = create_list(:sentence_group, 2, paragraph: @paragraph_1)
          @links_1 = create_list(:link, 2, paragraph: @paragraph_1)
        @paragraph_1_another = create(:paragraph, section: @section_1)
          @sentence_groups_1_another = create_list(:sentence_group, 2, paragraph: @paragraph_1_another)
          @links_1_another = create_list(:link, 2, paragraph: @paragraph_1_another)
      @section_2 = create(:section, page: @page_1)
        @images_2 = create_list(:image, 2, section: @section_2)
        @paragraph_2 = create(:paragraph, section: @section_2)
          @sentence_groups_2 = create_list(:sentence_group, 2, paragraph: @paragraph_2)
          @links_2 = create_list(:link, 2, paragraph: @paragraph_2)
        @paragraph_2_another = create(:paragraph, section: @section_2)
          @sentence_groups_2_another = create_list(:sentence_group, 2, paragraph: @paragraph_2)
          @links_1_another = create_list(:link, 2, paragraph: @paragraph_2)

    @page_2 = create(:page)
      @section_1 = create(:section, page: @page_2)
        @images_1 = create_list(:image, 2, section: @section_1)
        @paragraph_1 = create(:paragraph, section: @section_1)
          @sentence_groups_1 = create_list(:sentence_group, 2, paragraph: @paragraph_1)
          @links_1 = create_list(:link, 2, paragraph: @paragraph_1)
        @paragraph_1_another = create(:paragraph, section: @section_1)
          @sentence_groups_1_another = create_list(:sentence_group, 2, paragraph: @paragraph_1_another)
          @links_1_another = create_list(:link, 2, paragraph: @paragraph_1_another)
      @section_2 = create(:section, page: @page_2)
        @images_2 = create_list(:image, 2, section: @section_2)
        @paragraph_2 = create(:paragraph, section: @section_2)
          @sentence_groups_2 = create_list(:sentence_group, 2, paragraph: @paragraph_2)
          @links_2 = create_list(:link, 2, paragraph: @paragraph_2)
        @paragraph_2_another = create(:paragraph, section: @section_2)
          @sentence_groups_2_another = create_list(:sentence_group, 2, paragraph: @paragraph_2)
          @links_1_another = create_list(:link, 2, paragraph: @paragraph_2)
  end

  it "sends a collection of pages" do
    get '/api/v1/pages.json'

    expect(response).to be_successful

    pages = JSON.parse(response.body)

    expect(pages.class).to eq(Array)
    expect(pages.count).to eq(2)

    page = pages.first
    expect(page).to have_key("title")
    expect(page["title"].class).to eq(String)
    expect(page).to have_key("sections")
    expect(page["sections"].class).to eq(Array)
    expect(page["sections"].count).to eq(2)

    section = page["sections"].first

    expect(section).to have_key("title")
    expect(section["title"].class).to eq(String)

    expect(section).to have_key("alignment")
    expect(section["alignment"].class).to eq(String)

    expect(section).to have_key("number_of_left_aligned_elements")
    expect(section["number_of_left_aligned_elements"].class).to eq(Integer)

    expect(section).to have_key("images")
    expect(section["images"].count).to eq(2)
    expect(section["images"].class).to eq(Array)
    image = section["images"].first
    expect(image).to have_key("url")
    expect(image).to have_key("order_index")
    expect(image).to have_key("section_id")
    expect(image["url"].class).to eq(String)
    expect(image["order_index"].class).to eq(Integer)
    expect(image["section_id"].class).to eq(Integer)

    expect(section).to have_key("paragraphs")
    expect(section["paragraphs"].count).to eq(2)
    expect(section["paragraphs"].class).to eq(Array)
    paragraph = section["paragraphs"].first
    expect(paragraph).to have_key("order_index")
    expect(paragraph).to have_key("section_id")
    expect(paragraph["order_index"].class).to eq(Integer)
    expect(paragraph["section_id"].class).to eq(Integer)

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
