# encoding : utf-8
class Admin::BaseController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!, :require_admin

  def require_admin
    raise 'You are not authorized to access this page.' unless current_user.admin?
  end
end