require 'cucumber/rails'
require 'rspec-expectations'
require 'page-object'
require 'fig_newton'
require 'require_all'

World(PageObject::PageFactory)

require_rel 'pages'

PageObject::PageFactory.routes = {
    :default => [[HomePage, :adopt],
                 [DetailsPage, :add_to_cart],
                 [ShoppingCartPage, :proceed_to_checkout]]
}


