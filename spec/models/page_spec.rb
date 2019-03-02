require 'rails_helper'

RSpec.describe Page, type: :model do
  it "has has a title" do
    about_page = Page.create(title: "About")

    expect(about_page).to be_valid
    expect(about_page.title).to eq("About")
  end
end
