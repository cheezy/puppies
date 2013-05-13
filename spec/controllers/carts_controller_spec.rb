describe CartsController do
  
  def mock_cart(stubs={})
    @cart ||= mock_model(Cart, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all carts as @carts" do
      CartsController.skip_before_filter :authorize
      Cart.stub(:all) { mock_cart }
      get :index
      assigns(:carts).should == mock_cart
    end
  end
  
  describe "GET show" do
    it "assigns the requested cart as @cart" do
      Cart.stub(:find).with("37") { mock_cart }
      get :show, :id => "37"
      assigns(:cart).should be(mock_cart)
    end
  end

  describe "GET new" do
    it "assigns a new cart as @cart" do
      CartsController.skip_before_filter :authorize
      Cart.stub(:new) { mock_cart }
      get :new
      assigns(:cart).should be(mock_cart)
    end
  end

  describe "GET edit" do
    it "assigns the requested cart as @cart" do
      Cart.stub(:find).with("37") { mock_cart }
      get :edit, :id => "37"
      assigns(:cart).should be(mock_cart)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created puppy as @puppy" do
        Cart.stub!(:new).with({'these' => 'params'}) { mock_cart(:save => true) }
        post :create, :cart => {'these' => 'params'}
        assigns(:cart).should be(mock_cart)
      end

      it "redirects to the created cart" do
        Cart.stub!(:new) { mock_cart(:save => true) }
        post :create, :cart => {}
        response.should redirect_to(cart_url(mock_cart))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved cart as @cart" do
        Cart.stub!(:new).with({'these' => 'params'}) { mock_cart(:save => false) }
        post :create, :cart => {'these' => 'params'}
        assigns(:cart).should be(mock_cart)
      end

      it "re-renders the 'new' template" do
        Cart.stub!(:new) { mock_cart(:save => false) }
        post :create, :cart => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested cart" do
        Cart.stub(:find).with("37") { mock_cart }
        mock_cart.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :cart => {'these' => 'params'}
      end

      it "assigns the requested cart as @cart" do
        Cart.stub(:find) { mock_cart(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:cart).should be(mock_cart)
      end

      it "redirects to the cart" do
        Cart.stub(:find) { mock_cart(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(cart_url(mock_cart))
      end
    end

    describe "with invalid params" do
      it "assigns the cart as @cart" do
        Cart.stub(:find) { mock_cart(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:cart).should be(mock_cart)
      end

      it "re-renders the 'edit' template" do
        Cart.stub(:find) { mock_cart(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested cart" do
      Cart.stub(:find).with("37") { mock_cart }
      mock_cart.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the agency page" do
      Cart.stub(:find) { mock_cart }
      delete :destroy, :id => "1"
      response.should redirect_to(agency_url)
    end
  end

end
