FactoryBot.define do
  factory :section do
    title { "This is a section title" }

    # A section belongs to a page
    page
  end
end
