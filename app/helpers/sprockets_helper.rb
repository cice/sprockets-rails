module SprocketsHelper
  # Specify a list of strings to include a bunch of
  # files, or a single symbol to include a package
  # defined in config/sprockets_rails.yml
  def sprockets_include_tag *sprockets
    sprockets.flatten!
    
    sprocket_set = case
    when sprockets.empty?
      return ""
    when sprockets.first.is_a?(Symbol)
      SprocketSet::Id.new sprockets.first
    else
      SprocketSet::Id.new sprockets
    end
    
    if sprocket_set
      sprocket_set_include_tag sprocket_set
    else
      ""
    end
  end
  
  # Include a specific SprocketSet
  def sprocket_set_include_tag sprocket_set
    javascript_include_tag File.join('', SprocketsRails.configuration.javascripts_route, sprocket_set.to_s)
  end  
end
