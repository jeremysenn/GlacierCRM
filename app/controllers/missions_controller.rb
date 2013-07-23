class MissionsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @missions = Mission.all
  end

  def show
    @mission = Mission.find(params[:id])
  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(params[:mission])
    if @mission.save
      redirect_to @mission, :notice => "Successfully created mission."
    else
      render :action => 'new'
    end
  end

  def edit
    @mission = Mission.find(params[:id])
  end

  def update
    @mission = Mission.find(params[:id])
    if @mission.update_attributes(params[:mission])
      redirect_to @mission, :notice  => "Successfully updated mission."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @mission = Mission.find(params[:id])
    @mission.destroy
    redirect_to missions_url, :notice => "Successfully destroyed mission."
  end
end
