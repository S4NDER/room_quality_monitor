class AdminpagesController < ApplicationController
  before_action :authenticate_user!, :test_admin
  def index
  end

  def test_admin
    if !current_user.admin?
      current_user.update_attribute :admin, true
      
      redirect_to root_path
    end
  end
end