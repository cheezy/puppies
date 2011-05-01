require 'spec_helper'

describe AdminController do
    
  describe "GET index" do
    it "should return the total order count" do
      AdminController.skip_before_filter :authorize
      Order.should_receive(:count).and_return(2)
      get :index
      assigns[:total_orders].should be 2
    end
  end  
end
