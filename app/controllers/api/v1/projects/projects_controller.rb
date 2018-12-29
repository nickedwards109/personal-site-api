class Api::V1::Projects::ProjectsController < ApplicationController
  def index
    projects = Project.all

    serialized_projects = projects.map do |project|
      title = project.title
      paragraphs = project.paragraphs
      images = project.images
      serialized_project = {
        title: title,
        paragraphs: paragraphs,
        images: images
      }
    end

    render json: serialized_projects
  end
end
