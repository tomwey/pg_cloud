class Portal::ApplicationController < ApplicationController
  layout 'portal'
  
  before_filter :require_member
  before_filter :check_member
  before_filter :check_more_profile
end