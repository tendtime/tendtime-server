require 'ostruct'
 class ProjectsController < ApplicationController

  before_action :authenticate_user!

  def project_test


  	@project = OpenStruct.new({
  		products:[
  			OpenStruct.new({name: 'Toilets', quantity: 50, price_per_unit:45}),
  			OpenStruct.new({name: 'Doors', quantity: 400, price_per_unit:15}),
  			OpenStruct.new({name: 'Tables', quantity: 20, price_per_unit:30})
  		],
  		name: 'Project X',
  		description: 'A project for this A client cnad this B Model',
  		revit_file_path: 'c:/user/documents/project_X/3Dmodel/2015-04-12-V1' 
  	})
  end



end
