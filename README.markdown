SprocketsRails
=================

This is an extremely simple gem to use sprockets with Rails 3. 

## Usage
Place your javascripts in 

    app/javascripts
    
Use the sprockets\_include\_tag helper to include your javascripts:

    sprockets_include_tag 'application'
    
Or create a sprockets\_rails.yml in RAILS_ROOT/config and define packages:

    packages:
      defaults:
        - jquery
        - rails
        - application

And use the helper with a symbol as argument:

    sprockets_include_tag :defaults
    

## License

Copyright &copy; 2009 Sam Stephenson.

Copyright &copy; 2010 Nick Recobra, Marian Theisen.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
