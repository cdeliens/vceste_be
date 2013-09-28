class ApplicationController < ActionController::Base
  protect_from_forgery
  respond_to :json


  def require_http_auth_on_staging
    if Rails.env == "production" && !request.headers['HTTP_USER_AGENT'].eql?('facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)')
      authenticate_or_request_with_http_basic do |username, password|
        username == "cdeliens" && password == "60599049"
      end
    end
  end

end
