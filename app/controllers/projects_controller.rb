require 'ostruct'

class ProjectsController < ApplicationController

  before_action :authenticate_user!

  def index
    @projects = current_user.projects
  end

  def show
    @project = Project.find(params[:id])
    @project_requirements = @project.requirements.map do |family|
      family['types'].map do |requirement|
        requirement['product'] = Product.find_by(title: requirement['name'])
        requirement
      end
      family
    end
  end

  def update
    @project = Project.find(params[:id])
    begin
      @project.update(params.require(:project).permit(:requirements))
    rescue ActionController::ParameterMissing
      return redirect_to project_path(@project)
    end

    redirect_to project_path(@project)

  end

  private

  def chart_data(products)
    total = total_price(products)
    data = []
    products.each do |p|
      data << [p.name, ((p.quantity/total.to_f)*100.0)]
    end
    data
  end

  def total_price(products)
    total = 0
    products.each do |p|
      total += p.average_price
    end
    total
  end

end
