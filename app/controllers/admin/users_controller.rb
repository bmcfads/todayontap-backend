class Admin::UsersController < ApplicationController
  skip_before_action :authorize_request, only: %i[index show create]
  before_action :set_user, only: %i[show update destroy]

  # GET admin/users
  def index
    @users = User.all
  end

  # GET admin/users/:id
  def show; end

  # POST admin/users
  def create
    @user = User.new(user_params)

    if @user.save
      render :show, status: :created, location: admin_user_url(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT admin/users/:id
  def update
    if @user.update(user_params)
      render :show, status: :ok, location: admin_user_url(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE admin/users/:id
  def destroy
    @user.destroy
    redirect_to(admin_users_url)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
