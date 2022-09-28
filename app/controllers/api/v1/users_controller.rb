class Api::V1::UsersController < ApplicationController
  def create
    new_user = User.new(user_params)
    if User.find_by(email: params[:email])
      render json: { errors: 'One or all of the following have occured: Email already exist, passwords do not match, or field is missing'}, status: 400 
    elsif params[:password] != params[:password_confirmation]
      render json: { errors: 'One or all of the following have occured: Passwords do not match, email already exist, or field is missing' }, status: 400 
    else new_user.save
      render json: UserSerializer.create_user(new_user), status: 201
    end
  end

  private 
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end