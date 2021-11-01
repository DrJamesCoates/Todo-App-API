class UsersController < ApplicationController

  skip_before_action :authorize_request, only: :create
  
  # POST /signup
  # return authenticated token upon signup
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = {  message: Message.account_created, 
                  auth_token: auth_token,  
                  user_id: user.id  }
    json_response(response, :created)
  end

  def show
    user = User.find(show_user_params[:id])
    auth_token = JsonWebToken.encode(user_id: user.id) if user
    response = {  auth_token: auth_token, 
                  user_id: user.id, 
                  user_name: user.name, 
                  user_email: user.email  }
    json_response(response)
  end

  def update
    user = User.find(show_user_params[:id])
    user.update!(user_params)
    json_response(user)
  end

  def destroy
    user = User.find(show_user_params[:id])
    user.destroy
    head :no_content
  end
  

  private

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

  def show_user_params
    params.permit(:id)
  end

end