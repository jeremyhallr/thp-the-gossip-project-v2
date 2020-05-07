class ApplicationController < ActionController::Base
  include SessionsHelper
  helper_method :logged_in?

  def logged_in?
    !current_user.nil?
  end
end
