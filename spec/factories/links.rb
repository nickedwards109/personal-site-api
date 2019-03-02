FactoryBot.define do
  factory :link do
    url { "https://github.com/nickedwards109" }
    order_index { 1 }

    # A link belongs to a paragraph
    paragraph
  end
end
