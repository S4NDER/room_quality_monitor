class AdminpagesController < ApplicationController
  before_action :test_admin
  def index

  end

  def test_admin
    if !current_user.admin?
      redirect_to root_path
    end
  end
end