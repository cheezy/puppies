class ShoppingCartPage
  include PageObject

  ROWS_PER_PUPPY = 6
  NAME_COLUMN = 1
  SUBTOTAL_COLUMN = 3

  button(:continue_shopping, :value => 'Adopt Another Puppy')
  table(:cart, :index => 0)
  cell(:cart_total, :class => 'total_cell')

  def name_for_line_item(line_item)
    row_for(line_item)[NAME_COLUMN].text
  end

  def subtotal_for_line_item(line_item)
    row_for(line_item)[SUBTOTAL_COLUMN].text
  end

  private

  def row_for(line_item)
    row = (line_item - 1) * ROWS_PER_PUPPY
    cart_element[row]
  end

end