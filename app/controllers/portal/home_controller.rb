class Portal::HomeController < ApplicationController
  before_filter :require_member
  before_filter :check_member
  before_filter :check_more_profile
  
  def index
    
  end
end