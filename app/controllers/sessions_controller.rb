# coding: utf-8
class SessionsController < Devise::SessionsController
  layout 'account'
  
  def new
    super
  end
end