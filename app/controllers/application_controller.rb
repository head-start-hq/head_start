class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :set_time_zone, if: :user_signed_in?

  include SetCurrentRequestDetails

  rescue_from(ActiveSupport::MessageVerifier::InvalidSignature, with: :render_404)

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def set_time_zone
    Time.use_zone(current_user.time_zone_name) { yield }
  end

  def render_403
    respond_to do |format|
      format.any { head :forbidden }
    end
  end

  def render_404
    respond_to do |format|
      format.html { render file: Rails.root.join("public", "404.html"), layout: false, status: :not_found }
      format.any { head :not_found }
    end
  end
end
