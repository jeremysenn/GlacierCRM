class HomeController < ApplicationController
  before_filter :login_required, :except => []
  
  def index
    @users = User.all
  end
end
