require 'rails_helper'

RSpec.describe Image, type: :model do
  it "has a url, has an order_index, and belongs to a Project" do
    project = create(:project)

    image = Image.create(url: "", order_index: 0, project: project)

    expect(image).to be_valid 
  end
end
