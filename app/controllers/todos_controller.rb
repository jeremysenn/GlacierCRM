class TodosController < ApplicationController
  respond_to :html, :json
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    if current_user.has_role? :superuser
      @todos = Todo.all
    else
      @todos = current_user.todos
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(params[:todo])
    if @todo.save
      respond_to do |format|
        format.html { redirect_to @todo, :notice => "Successfully created todo." }
        format.js #Render javascript inline
      end
    else
      respond_to do |format|
        format.html { render :action => 'new' }
        format.js #Render javascript inline
      end
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update_attributes(params[:todo])
    respond_with @todo
#    if @todo.update_attributes(params[:todo])
#      redirect_to @todo, :notice  => "Successfully updated todo."
#    else
#      render :action => 'edit'
#    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    respond_to do |format|
      format.html {
        redirect_to todos_url, :notice => "Successfully destroyed todo."
        redirect_to root_path, :notice => "Successfully destroyed todo."
      }
      format.js
    end
  end
end
