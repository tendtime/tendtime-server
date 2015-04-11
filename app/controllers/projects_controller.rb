require 'ostruct'
 class ProjectsController < ApplicationController

  before_action :authenticate_user!

  def index
    @projects = current_user.projects
  end

  def show
    @project = current_user.projects.find(params[:id])
  end

  def project_test

  	@project = OpenStruct.new({
  		products:[
  			OpenStruct.new({name: 'Toilets', quantity: 50, description: 'White toilets', average_price:45, price_variance: 10}),
  			OpenStruct.new({name: 'Doors', quantity: 40, description: 'Extra doory doors', average_price:15, price_variance: 10}),
  			OpenStruct.new({name: 'Tables', quantity: 20, description: 'Tables that can hold things', average_price:30, price_variance: 10})
  		],
  		name: 'Project X',
  		description: 'A project for this A client cnad this B Model',
  		revit_file_path: 'c:/user/documents/project_X/3Dmodel/2015-04-12-V1' 
  	})
    @chart_data = chart_data(@project.products)
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
