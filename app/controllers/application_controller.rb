class ApplicationController < ActionController::API
  def current_user
    #mocks authentication
    User.first
  end
end
