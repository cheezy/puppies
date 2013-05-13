require 'rubygems'
require 'spork'

require 'cucumber/rails'
require 'rspec-expectations'
require 'page-object'
require 'fig_newton'
require 'require_all'

require_rel 'pages'

#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  World(PageObject::PageFactory)

  PageObject::PageFactory.routes = {
      :default => [[HomePage, :adopt],
                   [DetailsPage, :add_to_cart],
                   [ShoppingCartPage, :proceed_to_checkout]]
  }

end

Spork.each_run do
  # This code will be run each time you run your specs.

end




