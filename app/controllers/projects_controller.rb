require 'ostruct'

class ProjectsController < ApplicationController

  before_action :authenticate_user!


  def show
    @project = Project.find(params[:id])

    
  end
  

  def upload_file

    @project = Project.find(params[:id]).update_from_file params[:file]


    redirect_to action: :show

  end



end
