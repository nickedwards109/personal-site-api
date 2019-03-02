class Section < ApplicationRecord
  enum alignment: { center: 0, split_center: 1 }
  has_many :paragraphs
  has_many :images
end
