require 'rails_helper'

RSpec.describe Section, type: :model do
  it "has a title, has several paragraphs, and has several images" do
    section = Section.create(
      title: "This is the section title",
      alignment: "center",
      number_of_left_aligned_elements: 3
    )

    paragraphs = create_list(:paragraph, 2, section: section)
    images = create_list(:image, 2, section: section)

    expect(section).to be_valid
    expect(section.title).to eq("This is the section title")
    expect(section.alignment).to eq("center")
    expect(section.number_of_left_aligned_elements).to eq(3)
    expect(section.paragraphs.count).to eq(2)
    expect(section.images.count).to eq(2)

    split_section = Section.create(
      title: "This is the section title",
      alignment: "split_center",
      number_of_left_aligned_elements: 3
    )
    expect(split_section).to be_valid
    expect(split_section.alignment).to eq("split_center")
  end
end
