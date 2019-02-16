require 'rails_helper'

RSpec.describe SentenceGroup, type: :model do
  it "has copy, has an order_index, and belongs to a Paragraph" do
    paragraph = create(:paragraph)

    sentenceGroup = SentenceGroup.create(copy: "This is the first sentence in a group of sentences. This is the second sentence. This is the third.", order_index: 0, paragraph: paragraph)

    expect(sentenceGroup).to be_valid 
  end
end
