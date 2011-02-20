
class AgencyController < ApplicationController
  skip_before_filter :authorize
  
  def index
    @puppies = Puppy.paginate :page => params[:page], :order => 'name', :per_page => 4
  end

end
