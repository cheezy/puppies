require 'spec_helper'

describe Order do
  let(:order) { Factory.build :order }

  describe "validations" do
    it "should be valid" do
      order.should be_valid
    end
    
    it "should require a name" do
      order.name = nil
      order.should have_errors_on(:name).with_message("can't be blank")
    end
    
    it "should require an address" do
      order.address = nil
      order.should have_errors_on(:address).with_message("can't be blank")
    end
    
    it "should require an email address" do
      order.email = nil
      order.should have_errors_on(:email).with_message("can't be blank")
    end

    it "should require a payment type" do
      order.pay_type = nil
      order.should have_errors_on(:pay_type).with_message("can't be blank")
    end

    it "should require a valid payment type" do
      ['Check', 'Credit card', 'Purchase order'].each do |pay_type|
        order.pay_type = pay_type
        order.should be_valid
      end
      order.pay_type = 'bad pay type'
      order.should have_errors_on(:pay_type).with_message("is not included in the list")
    end

  end

end
