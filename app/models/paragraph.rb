class Paragraph < ApplicationRecord
  belongs_to :section
  has_many :sentence_groups
  has_many :links
end
