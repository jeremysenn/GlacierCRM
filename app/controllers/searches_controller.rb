class SearchesController < ApplicationController
  before_filter :login_required

  def index
    unless params[:q].blank?
      @search = Sunspot.search(Contact) do
        fulltext params[:q]
#        order_by :last_name, :asc
      end
      @results = @search.results
      @contacts = @search.results.select {|result| result.class.name == 'Contact'}
      @tasks = @search.results.select {|result| result.class.name == 'Task'}
      @appointments = @search.results.select {|result| result.class.name == 'Appointment'}
      @emails = @search.results.select {|result| result.class.name == 'Email'}
    else
      @results = []
      @contacts = []
      @tasks = []
      @appointments = []
      @emails = []
    end
  end

end
