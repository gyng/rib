class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize

  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      #redirect_to login_url, notice: "Admin access required."
      redirect_to :controller => 'sessions', :action => 'new'
    end
  end
end
