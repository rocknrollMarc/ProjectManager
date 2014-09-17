class ProjectsController < ApplicationController

  def index
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])

    if @project.save
      flash[:notice] = "Project has been successfully created."
    end
  end

end
