class AuthController < ApplicationController
  def callback
    logger.info request.env
  end
end
