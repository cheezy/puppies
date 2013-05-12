class HomePage
  include PageObject

  page_url FigNewton.base_url

  divs(:name, :class => 'name')
  buttons(:view_detail, :value => 'View Details')

  def adopt(name = "Brook")
    index = index_for(name)
    view_detail_elements[index].click
  end

  private

  def index_for(name)
    name_elements.find_index {|the_div| the_div.text == name}
  end

end