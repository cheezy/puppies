describe Puppy do
  let(:puppy) { FactoryGirl.build :puppy }

  describe "validations" do
    it "should be valid" do
      puppy.should be_valid
    end

    it "should require name" do
      puppy.name = nil
      puppy.should have_errors_on(:name).with_message("can't be blank")
    end
    
    it "should require breed" do
      puppy.breed = nil
      puppy.should have_errors_on(:breed).with_message("can't be blank")
    end
    
    it "should require a url for the image" do
      puppy.image_url = nil
      puppy.should have_errors_on(:image_url).with_message("can't be blank")
    end
    
    it "should require fees to be a number" do
      puppy.fees = "bad"
      puppy.should have_errors_on(:fees).with_message("is not a number")
    end
    
    it "should require the fee to be greater than 0.00" do
      puppy.fees = 0.00
      puppy.should have_errors_on(:fees).with_message("must be greater than 0.0")
    end
    
    it "should ensure that the image url is a valid image type" do
      ['gif', 'jpg', 'png'].each do |image_type|
        puppy.image_url = 'image.' + image_type
        puppy.should be_valid
      end
      puppy.image_url = 'image.bad'
      puppy.should have_errors_on(:image_url).with_message('must be a URL for GIF, JPG, or PNG image.')
    end
  end
end
