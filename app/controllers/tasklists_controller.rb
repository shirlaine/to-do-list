class TasklistsController < ApplicationController

  before_action :authenticate_user!

  def index
    @tasklists = Tasklist.order(:title)
  end

  def new
    @tasklist = Tasklist.new
  end

  def edit
    @tasklist = Tasklist.find(params[:id])
  end

  def create
    @tasklist = Tasklist.new(tasklist_params)
    if @tasklist.save
      flash[:success] = "Tasklist '" + @tasklist[:title] + "' has been created."
      redirect_to tasklists_path
    else
      flash.now[:alert] = "Tasklist '" + @tasklist[:title] + "' has not been saved. Name cannot be blank."
      render :new
    end
  end

  def update
    @tasklist = Tasklist.find(params[:id])
    @tasklistold = Tasklist.find(params[:id])
    if @tasklist.update(tasklist_params)
      flash[:success] = "Tasklist's name has been changed from '" + @tasklistold[:title] + "' to '" + @tasklist[:title] + "'."
      redirect_to tasklists_path
    else
      flash.now[:alert] = "Tasklist '" + @tasklist[:title] + "' has not been updated. Name cannot be blank."
      render :edit
    end
  end

  def destroy
    @tasklist = Tasklist.find(params[:id])
    @tasklist.destroy
    flash[:success] = "Tasklist '" + @tasklist[:title] + "' has been deleted."
    redirect_to tasklists_path
  end

  private

  def tasklist_params
    params.require(:tasklist).permit(:title)
  end

end
