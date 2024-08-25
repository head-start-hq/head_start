class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    super.tap do |hash|
      if hash.has_key?(:time_zone_offset)
        time_zone = ActiveSupport::TimeZone[hash.delete(:time_zone_offset).to_i]
        hash[:time_zone_name] = time_zone.name if time_zone
      end
    end
  end

  # def after_sign_up_path_for(resource)
  # end
end
