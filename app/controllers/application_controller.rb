class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :render_ad
  
  private
  def render_ad
    ads = Advertisement.all
    @ad = ads.sample
  end
end
