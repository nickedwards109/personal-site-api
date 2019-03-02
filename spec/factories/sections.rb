FactoryBot.define do
  factory :section do
    title { "This is a section title" }
    alignment { "split_center" }
    number_of_left_aligned_elements { 3 }

    # A section belongs to a page
    page
  end
end
