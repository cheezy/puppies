describe UsersController do
  before(:each) do
    UsersController.skip_before_filter :authorize
  end

  def mock_user(stubs={})
    @user ||= mock_model(User, stubs).as_null_object
  end
  
  describe "GET index" do
    it "assigns all users as @user" do
      User.stub(:order).with(:name) { mock_user }
      get :index
      assigns(:users).should == mock_user
    end
  end
  
  describe "GET show" do
    it "assigns the requested user as @user" do
      User.stub(:find).with("37") { mock_user }
      get :show, :id => "37"
      assigns(:user).should be(mock_user)
    end
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      CartsController.skip_before_filter :authorize
      Cart.stub!(:find) { mock_cart(:adoptions => [mock_adoption]) }
      User.stub(:new) { mock_user }
      get :new
      assigns(:user).should be(mock_user)
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      User.stub(:find).with("37") { mock_user }
      get :edit, :id => "37"
      assigns(:user).should be(mock_user)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created user as @user" do
        User.stub!(:new).with({'these' => 'params'}) { mock_user(:save => true) }
        post :create, :user => {'these' => 'params'}
        assigns(:user).should be(mock_user)
      end

      it "redirects to the users page" do
        User.stub!(:new) { mock_user(:save => true) }
        post :create, :user => {}
        response.should redirect_to(users_url)
      end

      it "should display a 'successfully created' message" do
        User.stub!(:new) { mock_user(:save => true, :name => 'Kim') }
        post :create, :user => {}
        flash[:notice].should == 'User Kim was successfully created.'
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        User.stub!(:new).with({'these' => 'params'}) { mock_user(:save => false) }
        post :create, :user => {'these' => 'params'}
        assigns(:user).should be(mock_user)
      end

      it "re-renders the 'new' template" do
        User.stub!(:new) { mock_user(:save => false) }
        post :create, :user => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user" do
        User.stub(:find).with("37") { mock_user }
        mock_user.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :user => {'these' => 'params'}
      end

      it "assigns the requested user as @user" do
        User.stub(:find) { mock_user(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:user).should be(mock_user)
      end

      it "redirects to the user" do
        User.stub(:find) { mock_user(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(users_url)
      end

      it "should display a 'successfully updated' message" do
        User.stub(:find) { mock_user(:update_attributes => true) }
        mock_user.should_receive(:name).and_return('Kim')
        put :update, :id => "1"
        flash[:notice].should == 'User Kim was successfully updated.'
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        User.stub(:find) { mock_user(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:user).should be(mock_user)
      end

      it "re-renders the 'edit' template" do
        User.stub(:find) { mock_user(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested user" do
      User.stub(:find).with("37") { mock_user }
      mock_user.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the users page" do
      User.stub(:find) { mock_user }
      delete :destroy, :id => "1"
      response.should redirect_to(users_url)
    end
  end

end
