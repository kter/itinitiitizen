class AuthController < ApplicationController
  def index
  end

  def sign_out
    cookies.clear
    session.clear
    redirect_to root_path
  end
end
