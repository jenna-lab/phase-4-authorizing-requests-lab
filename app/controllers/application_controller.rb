class ApplicationController < ActionController::API
  include ActionController::Cookies
  def user_not_authenticated
    render json: { error: 'You need to sign in or sign up

end
