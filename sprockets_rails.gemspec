Gem::Specification.new do |s|
  s.name        = "sprockets_rails"
  s.version     = "0.0.1"
  s.date        = Time.now.strftime("%Y-%m-%d")
  s.authors     = ["Marian Theisen"]
  s.email       = 'marian@cice-online.net'
  s.summary     = "Sprockets Rails"
  s.homepage    = "http://github.com/cice/sprockets-rails"
  s.description = "Sprockets Rails"

  s.files        =  Dir["**/*"] -
                    Dir["coverage/**/*"] -
                    Dir["rdoc/**/*"] -
                    Dir["doc/**/*"] -
                    Dir["sdoc/**/*"] -
                    Dir["rcov/**/*"]

  s.add_dependency "activesupport", ">= 3.0.0"
  s.add_dependency "sprockets"
  s.add_dependency 'yui-compressor'
end