FactoryBot.define do
  factory :link do
    url { "https://github.com/nickedwards109" }
    order_index { 1 }
    paragraph { nil }
  end
end
