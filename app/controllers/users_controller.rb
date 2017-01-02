class UsersController < ApplicationController

  def register
    hashJson = login_register_params
    @user = User.find_by_email(hashJson[:email])
    if @user.nil?
      @user = User.create(hashJson)
        if @user.save
          respond_to do |format|
            format.json {render :register}
          end
        else
          respond_to do |format|
            format.json {render :login_register_error}
          end
        end
    else
      respond_to do |format|
        format.json {render :login_register_error}
      end
    end
  end

  def login
    hashJson = login_register_params
    @user = User.find_by_email(hashJson[:email])

    if @user.password === hashJson[:password]
      respond_to do |format|
        format.json {render :login}
      end
    else
      respond_to do |format|
        format.json {render :login_register_error}
      end
    end

  end

  private
  def login_register_params
    params.require(:user).permit(:email,:password)
  end


end