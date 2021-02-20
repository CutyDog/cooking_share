class Api::Base < ApplicationController
  include ActionController::Cookies
  skip_before_action :verify_authenticity_token
end