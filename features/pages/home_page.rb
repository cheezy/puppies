
class HomePage
  include PageObject
  
  page_url "http://localhost:3000"
  
  def adopt_puppy_number puppy_number
    browser.button(:index => puppy_number.to_i - 1).click
  end
end