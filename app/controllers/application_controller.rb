class ApplicationController < ActionController::Base
  # authentication by devise
  before_action :authenticate_user!, only: [:index]
end
