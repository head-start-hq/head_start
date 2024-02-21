class Public::ApplicationController < ApplicationController
  layout "public"

  skip_before_action :authenticate_user!
end
