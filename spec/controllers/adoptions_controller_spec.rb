describe AdoptionsController do

  def mock_adoption(stubs={})
    @mock_adoption ||= mock_model(Adoption, stubs).as_null_object
  end
  
  def mock_puppy(stubs={})
    @mock_puppy ||= mock_model(Puppy, stubs).as_null_object
  end

  def mock_cart(stubs={})
    @cart ||= mock_model(Cart, stubs).as_null_object
  end
  
  describe "GET index" do
    it "assigns all adoptions as @adoptions" do
      Adoption.stub(:all) { mock_adoption }
      get :index
      assigns(:adoptions).should be(mock_adoption)
    end
  end
  
  describe "GET show" do
    it "assigns the requested adoption as @adoptions" do
      Adoption.stub(:find).with("37") { mock_adoption }
      get :show, :id => "37"
      assigns(:adoption).should be(mock_adoption)
    end
  end

  describe "GET new" do
    it "assigns a new adoption as @adoption" do
      Adoption.stub(:new) { mock_adoption }
      get :new
      assigns(:adoption).should be(mock_adoption)
    end
  end

  describe "GET edit" do
    it "assigns the requested adoption as @adoption" do
      Adoption.stub(:find).with("37") { mock_adoption }
      get :edit, :id => "37"
      assigns(:adoption).should be(mock_adoption)
    end
  end

  describe "POST create" do
    before(:each) do
      Puppy.stub!(:find) {mock_puppy}
    end
    
    describe "with valid params" do
      it "assigns a newly created adoption as @adoption" do
        Cart.stub!(:find) { mock_cart(:add_puppy => mock_adoption(:save => true)) }
        post :create, :adoption => {'these' => 'params'}
        assigns(:adoption).should be(mock_adoption)
      end

      it "redirects to the created adoption" do
        Cart.stub!(:find) { mock_cart(:add_puppy => mock_adoption(:save => true)) }
        post :create, :adoption => {}
        response.should redirect_to(adoption_url(mock_adoption))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved adoption as @adoption" do
        Cart.stub!(:find) { mock_cart(:add_puppy => mock_adoption(:save => false)) }
        post :create, :adoption => {'these' => 'params'}
        assigns(:adoption).should be(mock_adoption)
      end

      it "re-renders the 'new' template" do
        Cart.stub!(:find) { mock_cart(:add_puppy => mock_adoption(:save => false)) }
        post :create, :adoption => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested adoption" do
        Adoption.stub(:find).with("37") { mock_adoption }
        mock_adoption.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :adoption => {'these' => 'params'}
      end

      it "assigns the requested adoption as @adoption" do
        Adoption.stub(:find) { mock_adoption(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:adoption).should be(mock_adoption)
      end

      it "redirects to the adoption" do
        Adoption.stub(:find) { mock_adoption(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(adoption_url(mock_adoption))
      end
    end

    describe "with invalid params" do
      it "assigns the adoption as @adoption" do
        Adoption.stub(:find) { mock_adoption(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:adoption).should be(mock_adoption)
      end

      it "re-renders the 'edit' template" do
        Adoption.stub(:find) { mock_adoption(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested adoption" do
      Adoption.stub(:find).with("37") { mock_adoption }
      mock_adoption.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the adoptions list" do
      Adoption.stub(:find) { mock_adoption }
      delete :destroy, :id => "1"
      response.should redirect_to(adoptions_url)
    end
  end

end
