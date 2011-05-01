require 'spec_helper'

describe User do
  let(:user) { Factory.build :user }
  
  describe "validations" do
    it "should be valid" do
      user.should be_valid
    end
    
    it "should rquire a name" do
      user.name = nil
      user.should have_errors_on(:name).with_message("can't be blank")
    end
    
    it "should ensure two users do not have the same name" do
      Factory(:user)
      user.should have_errors_on(:name).with_message("has already been taken")
    end
    
    it "should require a password" do
      user.hashed_password = nil
      user.should have_errors_on(:password).with_message("Missing password")
    end
  end

  describe "authentication" do
    it "should authenticate a user" do
      User.stub(:find_by_name) { user }
      User.stub(:encrypt_password) { user.hashed_password }
      User.authenticate(user.name, user.password).should == user
    end
  end

  it "should encrypt the password" do
    User.stub(:encrypt_password) { 'encrypted' }
    user.password = 'pass'
    user.hashed_password.should == 'encrypted'
  end

end
