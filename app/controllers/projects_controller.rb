class ProjectsController < ApplicationController

  def index
  end

  def new
    @projects = Project.new
  end
end
