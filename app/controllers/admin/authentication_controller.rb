class Admin::AuthenticationController < ApplicationController
  skip_before_action :authorize_request

  # POST /admin/auth/login
  def login
    @user = User.find_by(email: params[:email])&.authenticate(params[:password])
    if @user
      token = encode_jwt({ name: @user.name, email: @user.email })
      render json: { token: }, status: :ok
    else
      render json: { error: 'login failed' }, status: :unauthorized
    end
  end
end
