class Api::V1::Sections::SectionsController < ApplicationController
  def index
    sections = Section.all

    serialized_sections = sections.map do |section|
      alignment = section.alignment
      number_of_left_aligned_elements = section.number_of_left_aligned_elements
      title = section.title
      images = section.images
      paragraphs = section.paragraphs.map do |paragraph|
        {
          section_id: section.id,
          order_index: paragraph.order_index,
          sentence_groups: paragraph.sentence_groups,
          links: paragraph.links
        }
      end
      serialized_section = {
        alignment: alignment,
        number_of_left_aligned_elements: number_of_left_aligned_elements,
        title: title,
        paragraphs: paragraphs,
        images: images
      }
    end

    render json: serialized_sections
  end
end
