Rails.application.routes.draw do
  resources :sprockets, :only => :show, :path => SprocketsRails.configuration.javascripts_route
end
