class Users::SessionsController < Devise::SessionsController
  before_action :redirect_admin_user, only: [:new]

  def new
    super
  end

  def destroy
    super
  end

  protected

  def redirect_admin_user
    if admin_signed_in?
      redirect_to root_url, alert: 'Please sign out of admin session'
    end
  end

end
