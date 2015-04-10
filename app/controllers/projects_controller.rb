 class ProjectsController < ApplicationController

  before_action :authenticate_user!

  def project_test
    render text: 'hello'
  end



end
