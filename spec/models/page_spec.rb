require 'rails_helper'

RSpec.describe Page, type: :model do
  it "has has a title" do
    about_page = Page.create(title: "About")

    expect(about_page).to be_valid
    expect(about_page.title).to eq("About")
  end

  it "has many sections" do
    section_1 = create(:section)
    section_2 = create(:section)

    page = Page.create(title: "About")

    page.sections << section_1
    page.sections << section_2
    page.save

    expect(page).to be_valid
    expect(page.sections.count).to eq(2)
  end
end
