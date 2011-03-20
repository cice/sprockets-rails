require 'active_support/hash_with_indifferent_access'

module SprocketsRails 
  class Configuration < HashWithIndifferentAccess
    class << self
      def load config_file
        new YAML.load_file(config_file)
      end
    end
    
    def load config_file
      return self unless File.exists?(config_file)
      
      merge! self.class.load(config_file)
    end
    
    def javascripts_path
      self[:javascripts_path] || 'app/javascripts'
    end
    
    def javascripts_lib_path
      self[:javascripts_lib_path] || 'app/javascripts/lib'
    end
    
    def javascripts_route
      self[:javascripts_route] || 'javascripts'
    end
    
    def load_paths
      self[:load_paths] || []
    end
    
    def packages
      self[:packages] || {}
    end
    
    def get_package name
      self[:packages][name.to_s]
    end
    
    def merge! other
      p = packages
      l = load_paths
      super
      
      self[:packages] = p.merge packages
      self[:load_paths] = l + load_paths
      
      self
    end
  end
end