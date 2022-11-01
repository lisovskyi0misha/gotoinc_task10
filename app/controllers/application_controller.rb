class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :warning, :success

  def after_sign_in_path_for(user)
    if current_user.admin?
      admin_stations_path
    else
      find_ticket_path
    end
  end
end
