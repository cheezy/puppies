class PersonalInfoPage
  include PageObject
  
  DEFAULT_DATA = {
    'name' => 'cheezy',
    'address' => '123 main street',
    'email' => 'cheezy@leandog.com',
    'pay_type' => 'Credit card',
    'accept' => true
  }
  
  text_field(:name, :id => 'order_name')
  text_area(:address, :id => 'order_address')
  text_field(:email, :id => 'order_email')
  select_list(:pay_type, :id => 'order_pay_type')
  checkbox(:accept, :id => 'order_accept')
  button(:place_adoption, :text => 'Place Adoption')
  
  def complete_adoption(personal_info)
    personal_info = DEFAULT_DATA.merge(personal_info)
    self.name = personal_info['name']
    self.address = personal_info['address']
    self.email = personal_info['email']
    self.pay_type = personal_info['pay_type']
    self.check_accept if personal_info['accept']
    place_adoption
  end
end
