class SprocketsController < ActionController::Base
  respond_to :js
  caches_page :show, :if => proc {Rails.configuration.action_controller.perform_caching}
  
  def show
    sprocket_set = SprocketSet.new params[:id]
    
    respond_with sprocket_set
  end
end
