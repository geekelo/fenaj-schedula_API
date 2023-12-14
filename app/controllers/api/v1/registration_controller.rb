class Api::V1::RegistrationController < ApplicationController
  def create
    if email_exists(signapp_params[:email])
      render json: { error: 'User email already taken' }, status: :unproccessable_entity
    else
      user = User.new(signapp_params)
      if user.save
        render json: { message: 'User created sucessfully', user: }, status: :ok
      else
        render json: { error: 'Something went wrong with creating user' }, status: :unproccessable_entity
      end
    end
  end

  protected

  def signapp_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def email_exists(email)
    User.exists?(email:)
  end
end
