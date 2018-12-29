FactoryBot.define do
  factory :paragraph do
    copy { "This is the copy text in a paragraph." }

    # This setup assumes that the tests create a list of two paragraphs and a list of two images.
    # This factory creates 2 paragraphs with order_index of 0 and 1, and assumes that there will also be two images created with order_index of 2 and 3
    sequence(:order_index) { |n| n }

    # A paragraph belongs to a project
    project
  end
end
