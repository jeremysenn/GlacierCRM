class HomeController < ApplicationController
  before_filter :login_required, :except => []
  
  def index
    @clients = current_user.company.contacts.order(:last_name).tagged_with("Client")
    @todos = current_user.todos
  end
end
