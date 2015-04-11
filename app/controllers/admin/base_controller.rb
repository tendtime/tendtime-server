class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  #TODO: check role

  def dashboard
  end
end
