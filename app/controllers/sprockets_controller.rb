class SprocketsController < ActionController::Base
  respond_to :js
  caches_page :show, :if => proc(&:perform_caching?)
  
  def show
    sprocket_set = SprocketSet.new params[:id]
    
    respond_with sprocket_set
  end
  
  protected
  def perform_caching?
    Rails.configuration.action_controller.perform_caching
  end
end
