require 'spec_helper'

describe PuppiesController do
  before(:each) do
    PuppiesController.skip_before_filter :authorize
  end

  def mock_puppy(stubs={})
    @puppy ||= mock_model(Puppy, stubs).as_null_object
  end
  
  describe "GET index" do
    it "assigns all puppys as @puppies" do
      Puppy.stub(:all) { mock_puppy }
      get :index
      assigns(:puppies).should == mock_puppy
    end
  end
  
  describe "GET show" do
    it "assigns the requested puppy as @puppy" do
      Puppy.stub(:find).with("37") { mock_puppy }
      get :show, :id => "37"
      assigns(:puppy).should be(mock_puppy)
    end
  end

  describe "GET new" do
    it "assigns a new puppy as @puppy" do
      CartsController.skip_before_filter :authorize
      Cart.stub!(:find) { mock_cart(:adoptions => [mock_adoption]) }
      Puppy.stub(:new) { mock_puppy }
      get :new
      assigns(:puppy).should be(mock_puppy)
    end
  end

  describe "GET edit" do
    it "assigns the requested puppy as @puppy" do
      Puppy.stub(:find).with("37") { mock_puppy }
      get :edit, :id => "37"
      assigns(:puppy).should be(mock_puppy)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created puppy as @puppy" do
        Puppy.stub!(:new).with({'these' => 'params'}) { mock_puppy(:save => true) }
        post :create, :puppy => {'these' => 'params'}
        assigns(:puppy).should be(mock_puppy)
      end

      it "redirects to the puppy page" do
        Puppy.stub!(:new) { mock_puppy(:save => true) }
        post :create, :puppy => {}
        response.should redirect_to(puppy_url(mock_puppy))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved puppy as @puppy" do
        Puppy.stub!(:new).with({'these' => 'params'}) { mock_puppy(:save => false) }
        post :create, :puppy => {'these' => 'params'}
        assigns(:puppy).should be(mock_puppy)
      end

      it "re-renders the 'new' template" do
        Puppy.stub!(:new) { mock_puppy(:save => false) }
        post :create, :puppy => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested puppy" do
        Puppy.stub(:find).with("37") { mock_puppy }
        mock_puppy.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :puppy => {'these' => 'params'}
      end

      it "assigns the requested puppy as @puppy" do
        Puppy.stub(:find) { mock_puppy(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:puppy).should be(mock_puppy)
      end

      it "redirects to the puppy" do
        Puppy.stub(:find) { mock_puppy(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(puppy_url(mock_puppy))
      end
    end

    describe "with invalid params" do
      it "assigns the puppy as @puppy" do
        Puppy.stub(:find) { mock_puppy(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:puppy).should be(mock_puppy)
      end

      it "re-renders the 'edit' template" do
        Puppy.stub(:find) { mock_puppy(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested puppy" do
      Puppy.stub(:find).with("37") { mock_puppy }
      mock_puppy.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the puppies page" do
      Puppy.stub(:find) { mock_puppy }
      delete :destroy, :id => "1"
      response.should redirect_to(puppies_url)
    end
  end

end
