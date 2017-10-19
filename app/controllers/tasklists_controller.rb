class TasklistsController < ApplicationController

  def index
    @tasklists = Tasklist.all
  end

  def show
    @tasklist = Tasklist.find(params[:id])
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
      redirect_to tasklists_path
    else
      render :new
    end
  end

  def update
    @tasklist = Tasklist.find(params[:id])
    if @tasklist.update(tasklist_params)
      redirect_to tasklists_path
    else
      render :edit
    end
  end

  def destroy
    @tasklist = Tasklist.find(params[:id])
    @tasklist.destroy
    redirect_to tasklists_path
  end

  private

  def tasklist_params
    params.require(:tasklist).permit(:title)
  end

end
