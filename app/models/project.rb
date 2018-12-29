class Project < ApplicationRecord
  has_many :paragraphs
  has_many :images
end
