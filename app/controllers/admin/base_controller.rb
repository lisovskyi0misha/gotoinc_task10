class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin

  private

  def check_if_admin
    unless current_user.admin?
      flash[:alert] = 'You don`t have admin rights'
      redirect_to root_path
    end
  end
end
