class Api::V1::AuthenticationController < ApplicationController
  def create
    user = User.find_by(email: params[:user][:email])
    if user&.authenticate(params[:user][:password])
      render json: {
        message: 'User is logged in',
        user: UserSerializer.new(user),
        token: JsonWebToken.encode({sub: user.id}),
      }, status: :ok
    else
      render json: {error: 'Invalid credentials'}, status: :unauthorized
    end
  end
end