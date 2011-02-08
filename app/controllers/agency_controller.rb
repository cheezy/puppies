class AgencyController < ApplicationController
  skip_before_filter :authorize
  def index
    @puppies = Puppy.all
  end

end
