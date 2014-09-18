class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = "Project has been successfully created."
      redirect_to @project
    else
      flash[:alert] = "Project has not been created."
      render :new
    end
  end

  def edit
    @project = Project.find(prarams[:id])
  end

  private
  def project_params
    params.require(:project).permit(:name, :description)
  end

end
