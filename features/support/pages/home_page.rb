class HomePage
  include PageObject

  page_url FigNewton.base_url

  divs(:name, :class => 'name')
  divs(:detail, :class => 'details')
  divs(:image, :class => 'image')
  buttons(:view_detail, :value => 'View Details')

  def adopt(name = "Brook")
    index = names.index(name)
    view_detail_elements[index].click
  end

  def names
    name_elements.collect(&:text)
  end

  def details
    detail_elements.collect(&:text)
  end

  def images
    image_elements
  end

end