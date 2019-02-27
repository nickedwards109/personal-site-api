class Api::V1::Projects::ProjectsController < ApplicationController
  def index
    projects = Project.all

    serialized_projects = projects.map do |project|
      alignment = project.alignment
      number_of_left_aligned_elements = project.number_of_left_aligned_elements
      title = project.title
      images = project.images
      paragraphs = project.paragraphs.map do |paragraph|
        {
          project_id: project.id,
          order_index: paragraph.order_index,
          sentence_groups: paragraph.sentence_groups,
          links: paragraph.links
        }
      end
      serialized_project = {
        alignment: alignment,
        number_of_left_aligned_elements: number_of_left_aligned_elements,
        title: title,
        paragraphs: paragraphs,
        images: images
      }
    end

    render json: serialized_projects
  end
end
