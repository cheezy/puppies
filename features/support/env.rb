require 'rubygems'
require 'cucumber/rails'
require 'rspec-expectations'
require 'page-object'
require 'fig_newton'
require 'require_all'

require_rel 'pages'

World(PageObject::PageFactory)

PageObject::PageFactory.routes = {
  :default => [[HomePage, :adopt],
               [DetailsPage, :add_to_cart],
               [ShoppingCartPage, :proceed_to_checkout]]
}



