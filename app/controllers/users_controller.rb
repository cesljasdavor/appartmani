class UsersController < ApplicationController
  attr_accessor :reservations

  def register
    hashJson = email_and_password
    @user = User.find_by_email(hashJson[:email])
    debugger
    if @user.nil?
      @user = User.create(hashJson)
        if @user.save
          person = Person.create(person_params)
          person.user_id = @user.id
          person.save
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

  def confirm_registration
    hashJson = extract_email
    @user = User.find_by_email(hashJson[:email])
    if @user != nil
      if @user.privilege === 0
        if @user.update(privilege: 1)
          respond_to do |format|
            format.json {render :confirm_registration}
          end
        else
          respond_to do |format|
            format.json {render :confirmation_failed}
          end
        end
      end
    else
      respond_to do |format|
        format.json {render :confirmation_failed}
      end
    end
  end

  def login
    hashJson = email_and_password
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

  def get_admins
    respond_to do |format|
      format.json {render :get_admins}
    end
  end

  def add_admin
    hashJson = extract_email
    @user = User.find_by email: hashJson[:email]

    if @user.update(privilege: 2)
      respond_to do |format|
        format.json {render :add_admin}
      end
    else
      respond_to do |format|
        format.json {render :add_admin_error}
      end
    end
  end

  def destroy
    hashJson = extract_email
    @user = User.find_by email: hashJson[:email]
    if @user.nil?
      respond_to do |format|
        format.json {render :remove_user_error}
      end
    else
      if @user.destroy
        respond_to do |format|
          format.json {render :remove_user}
        end
      else
        respond_to do |format|
          format.json {render :remove_user_error}
        end
      end
    end
  end

  def get_reservations
    hashJson = extract_email
    @reservations = Reservation.where email: hashJson[:email]
    respond_to do |format|
      format.json {render :get_reservations}
    end
  end

  private
  def email_and_password
    params.require(:user).permit(:email,:password)
  end

  def person_params
    params.permit(:city, :country, :name, :surname, :address, :addressNo)
  end

  def extract_email
    params.require(:user).permit(:email)
  end


end