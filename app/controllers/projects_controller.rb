require 'ostruct'

class ProjectsController < ApplicationController

  before_action :authenticate_user!


  def show
    @project = Project.find(params[:id])
  end
  

  def update
    @project = Project.find(params[:id])
    @project.update(params.require(:project).permit(:requirements))

    redirect_to project_path(@project)
  end
end
