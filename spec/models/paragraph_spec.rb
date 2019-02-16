require 'rails_helper'

RSpec.describe Paragraph, type: :model do
  it "has an order_index, has many sentence_groups, has many links, and belongs to a Project" do
    project = create(:project)

    paragraph = Paragraph.create(order_index: 0, project: project)

    sentence_group_1 = create(:sentence_group, paragraph: paragraph)
    sentence_group_2 = create(:sentence_group, paragraph: paragraph)
    link_1 = create(:link, paragraph: paragraph)
    link_2 = create(:link, paragraph: paragraph)

    expect(paragraph).to be_valid
    expect(paragraph.sentence_groups).to include(sentence_group_1)
    expect(paragraph.sentence_groups).to include(sentence_group_2)
    expect(paragraph.links).to include(link_1)
    expect(paragraph.links).to include(link_2)
  end
end
