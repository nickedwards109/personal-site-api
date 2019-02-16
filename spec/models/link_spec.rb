require 'rails_helper'

RSpec.describe Link, type: :model do
  it "has a URL, has an order_index, and belongs to a Paragraph" do
    paragraph = create(:paragraph)

    link = Link.create(url: "https://github.com/nickedwards109", order_index: 0, paragraph: paragraph)

    expect(link).to be_valid 
  end
end
