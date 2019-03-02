require 'rails_helper'

RSpec.describe Image, type: :model do
  it "has a url, has an order_index, and belongs to a Section" do
    section = create(:section)

    image = Image.create(url: "", order_index: 0, section: section)

    expect(image).to be_valid
  end
end
