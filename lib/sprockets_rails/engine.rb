require 'sprockets_rails/configuration'

module SprocketsRails
  mattr_accessor :configuration
  
  class Engine < Rails::Engine
    
    
    initializer 'sprockets_rails.initialize' do
      load_configuration
      
      Rails.application.paths.app.sprockets SprocketsRails.configuration.javascripts_path, :glob => "**/*.js"
      Rails.application.paths.app.sprockets_lib SprocketsRails.configuration.javascripts_path, :glob => "lib/**/*.js"      
      
      config.to_prepare do
        ApplicationController.send :helper, :sprockets
      end
    end
    
    
    
    protected
    def load_configuration
      SprocketsRails.configuration = SprocketsRails::Configuration.load default_config_file
      
      SprocketsRails.configuration.load app_config_file    
    end
    
    def default_config_file
      File.join root, %w(config sprockets_rails.yml)
    end
    
    def app_config_file
      File.join Rails.root, %w(config sprockets_rails.yml)      
    end
  end
end