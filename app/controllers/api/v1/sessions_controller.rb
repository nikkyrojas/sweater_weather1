class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.create_user(user), status: 200
    else
      render json: { errors: 'One of the following errors have occured: passwords do not match, invalid email, or field is missing' }, status: 400
    end
  end

  def destroy
    session.destroy
  end
end
