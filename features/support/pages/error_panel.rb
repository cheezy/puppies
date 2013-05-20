module ErrorPanel
  include PageObject

  div(:error_div, :id => 'error_explanation')
  unordered_list(:errors) do |page|
    page.error_div_element.unordered_list_element
  end

end
