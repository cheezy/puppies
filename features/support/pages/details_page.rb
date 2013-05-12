class DetailsPage
  include PageObject

  button(:add_to_cart, :value => 'Adopt Me!')
  div(:content, :id => 'content')
  div(:puppy_info) do |page|
    page.content_element.div_element(:index => 2)
  end
  span(:fee, :class => 'fees')

  def adoption_fee
    fee[/\$\d+\.\d+/]
  end
end