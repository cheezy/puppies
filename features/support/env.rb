require 'rubygems'
require 'spork'

require 'cucumber/rails'
require 'rspec-expectations'
require 'page-object'
require 'fig_newton'
require 'require_all'

require_rel 'pages'

Spork.prefork do

  World(PageObject::PageFactory)

  PageObject::PageFactory.routes = {
      :default => [[HomePage, :adopt],
                   [DetailsPage, :add_to_cart],
                   [ShoppingCartPage, :proceed_to_checkout]]
  }

end

Spork.each_run do
end




