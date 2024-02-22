class SessionsController < ApplicationController
  def create
    user=User.find_by(username:params[:username])
    if user&.authenticate(params[:password])
      render json: {token:'token'},status: :ok
    else
      render json: {error:'invalid credentials'}, status: :unauthorized
    end
  end
end
