describe SessionsController do

  def mock_user(stubs={})
    @user ||= mock_model(User, stubs).as_null_object
  end
  
  describe "POST create" do

    describe "when authentication successful" do
      it "should authenticate the user" do
        User.should_receive(:authenticate).with('name', 'pass')
        post :create, {:name => 'name', :password => 'pass'}
      end

      it "should create a user session when authentication is successful" do
        User.stub(:authenticate) { mock_user(:id => 2) }
        post :create
        session[:user_id].should == 2
      end
    
      it "should redirect to the admin page " do
        User.stub(:authenticate) { mock_user }
        post :create
        response.should redirect_to admin_url
      end
    end
    
    describe "when authentication failed" do
      before(:each) do
        User.stub(:authentication) { nil }
      end
      
      it "should redirect back to the login url" do
        post :create
        response.should redirect_to login_url
      end
      
      it "should display 'Invalid user/password combination'" do
        post :create
        flash[:alert].should == 'Invalid user/password combination'
      end

    end
  end

  describe "DELETE destroy" do
    it "should remove the user's session" do
      session[:user_id] = 'session'
      delete :destroy
      session[:user_id].should be_nil
    end

    it "should redirect the user to the agency url" do
      delete :destroy
      response.should redirect_to(agency_url)
    end
    
    it "should display the message 'Logged out'" do
      delete :destroy
      flash[:notice].should == 'Logged out'
    end

  end
end
