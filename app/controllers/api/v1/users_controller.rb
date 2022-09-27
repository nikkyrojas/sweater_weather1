class Api::V1::UsersController < ApplicationController
  def create
    new_user = User.new(user_params)
    if new_user.save
      user = render json: UserSerializer.create_user(new_user), status: 201
    else
      render status: 400
    end
  end

  private 
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end