class HomeController < ApplicationController
  before_filter :login_required, :except => []
  
  def index
    @clients = current_user.company.contacts.order(:last_name).tagged_with("Client")
    @missions = current_user.missions
    @tasks = current_user.tasks
  end
end
