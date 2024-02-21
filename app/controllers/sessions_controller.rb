class SessionsController < Devise::SessionsController
  # replaced with :require_no_authentication_without_flash
  skip_before_action :require_no_authentication, only: %i[new create]
  prepend_before_action :require_no_authentication_without_flash, only: %i[new create]

  def create
    super
    flash.delete(:notice)
  end

  private

  def require_no_authentication_without_flash
    require_no_authentication

    if flash[:alert] == t("devise.failure.already_authenticated")
      flash.delete(:alert)
    end
  end

  # def after_sign_in_path_for(resource)
  #   stored_location_for(resource)
  # end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
