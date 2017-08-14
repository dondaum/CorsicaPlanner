class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource




  def is_admin?
    # check if user is a admin
    # if not admin then redirect to where ever you want
    redirect_to root_path unless current_user.admin?
  end


  protected

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end


end
