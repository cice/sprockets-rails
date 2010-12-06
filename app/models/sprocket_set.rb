require 'sprockets'
require 'yui/compressor'

class SprocketSet
  class Id  
    def initialize string_or_array = []
      case string_or_array
      when String
        @encoded = string_or_array
      when Array
        @decoded = string_or_array
      when Symbol        
        if pkg_files = SprocketsRails.configuration.packages[string_or_array]
          @decoded = pkg_files
        else
          raise "Package #{string_or_array} not found"
        end
      else
        raise "Expceted String or Array or Symbol"
      end
    end
    
    def to_a
      @decoded ||= ActiveSupport::JSON.decode(URI.unescape(Base64.decode64(@encoded)))
    end

    def to_s
      @encoded ||= ERB::Util.html_escape(Base64.encode64(@decoded.to_json).gsub(/[\n\r]/,''))
    end
  end
  
  attr_reader :sprocket_id, :files
  
  def initialize sources
    @sprocket_id = Id.new sources
    
    find_sprockets @sprocket_id.to_a
  end
  
  def concatenation
    secretary.reset!
    secretary.concatenation
  end
  
  def minification
    compressor.compress concatenation.to_s
  end
  
  def to_js options = nil
    Rails.env.development? ? concatenation.to_s : minification.to_s
  end
  
  protected
  def compressor
    @compressor ||= YUI::JavaScriptCompressor.new :munge => true
  end
  
  def secretary
    @secretary ||= Sprockets::Secretary.new :root => Rails.root,
                                            :load_path => SprocketsRails.configuration.load_paths,
                                            :source_files => files
  end
  
  def find_sprocket filename
    filename.sub! /(\.js)?\Z/, '.js'
    Rails.application.paths.app.sprockets.to_a.find do |sprocket|
      sprocket.ends_with? filename
    end
  end
  
  def find_sprockets files
    @files = files.map do |filename|
      find_sprocket filename
    end.compact
  end
end