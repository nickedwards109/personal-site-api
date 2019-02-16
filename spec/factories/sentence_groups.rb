FactoryBot.define do
  factory :sentence_group do
    copy { "This is a sentence. This is another sentence. This is yet another sentence." }
    order_index { 1 }
    paragraph { nil }
  end
end
