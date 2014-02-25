class User::RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
    auth = session['devise.auth']

    if auth.present?
      @user.first_name = auth[:info][:first_name]
      @user.last_name = auth[:info][:last_name]
    end
  end

  def create
    super do |resource|
      resource.create_authorization(session['devise.auth'])
    end
  end

  protected

  def after_update_path_for(resource)
    edit_user_registration_path
  end
end