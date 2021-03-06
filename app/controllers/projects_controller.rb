require 'ostruct'

class ProjectsController < ApplicationController

  before_action :authenticate_user!

  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  def show
    @project = Project.find(params[:id])
    @chart_data = []
    @total_price = total_price(@project.requirements)
    @project_requirements = @project.requirements.map do |family|
      family['types'].map do |requirement|
        requirement['product'] = Product.find_by(title: requirement['name'])
        total_produce_cost = requirement['product'].price_per_unit * requirement['quantity'].to_f
        @chart_data << [requirement['product'].title,  ((total_produce_cost/@total_price)*100.0)]
        requirement
      end
      family
    end
  end

  def update
    @project = Project.find(params[:id])
    begin
      @project.update(params.require(:project).permit(:requirements))
    rescue Exception #ActionController::ParameterMissing
      flash[:error] = "Sorry, there is something wrong with the file format"
      # return redirect_to project_path(@project)
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

  def total_price(requirements)
    total = 0
    requirements.each do |family|
      family['types'].map do |requirement|

        product= Product.find_by(title: requirement['name'])
        total += product.price_per_unit * requirement['quantity'].to_f
      end
    end
    total
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :budget)
  end

end
