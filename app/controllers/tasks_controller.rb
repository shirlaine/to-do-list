class TasksController < ApplicationController

  before_action :prepare_tasklist

  def index
    @tasks = @tasklist.tasks
  end

  def show
    @task = @tasklist.tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = @tasklist.tasks.new(task_params)
    if @task.save
      flash[:notice] = 'Your task has been saved'
      redirect_to tasklist_tasks_path(@tasklist)
    else
      flash.now[:error] = 'Your task has not been saved. Name cannot be blank.'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = 'Your task has been updated'
      redirect_to tasklist_tasks_path
    else
      flash.now[:error] = 'Your task has not been updated. Name cannot be blank.'
      render :edit
    end
  end

  def destroy
    @task = @tasklist.tasks.find(params[:id])
    @task.destroy
    flash[:notice] = 'Your task has been deleted'
    redirect_to tasklist_tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :due_date)
  end

  def prepare_tasklist
    @tasklist = Tasklist.find(params[:tasklist_id])
  end

end
