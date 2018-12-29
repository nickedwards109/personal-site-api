require 'rails_helper'

RSpec.describe Paragraph, type: :model do
  it "has copy text, has an order_index, and belongs to a Project" do
    project = create(:project)

    paragraph = Paragraph.create(copy: "This is the copy text of a paragraph.", order_index: 0, project: project)

    expect(paragraph).to be_valid 
  end
end
