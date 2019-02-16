class Paragraph < ApplicationRecord
  belongs_to :project
  has_many :sentence_groups
  has_many :links
end
