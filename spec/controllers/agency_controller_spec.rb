require 'spec_helper'

describe AgencyController do

  def mock_puppy(stubs={})
    @mock_puppy ||= mock_model(Puppy, stubs).as_null_object
  end

  context "handling GET /index" do
    before(:each) do
      Puppy.stub!(:paginate).and_return(mock_puppy)
    end
    
    def do_get
      get :index
    end
    
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render the index template" do
      do_get
      response.should render_template('index')
    end
    
    it "should retrieve and paginate all puppies" do
      Puppy.should_receive(:paginate)
      do_get
    end

    it "should assign the products for the view" do
      do_get
      assigns[:puppies].should == mock_puppy
    end


  end

end
