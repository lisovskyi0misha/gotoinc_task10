# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  def create
    super
    flash[:success] = "Hi, #{@user.name}"
  end
end
