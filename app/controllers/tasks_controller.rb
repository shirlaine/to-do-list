class TasksController < ApplicationController

  before_action :prepare_tasklist

  def index
    @tasks = @tasklist.tasks.all.order(name: :asc).sort_by { |task| task.status ? 1 : 0 }
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
      flash[:success] = 'Your task has been saved'
      redirect_to tasklists_path(@tasklist)
    else
      flash.now[:alert] = 'Your task has not been saved. Name cannot be blank.'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = 'Your task has been updated'
      redirect_to tasklists_path
    else
      flash.now[:alert] = 'Your task has not been updated. Name cannot be blank.'
      render :edit
    end
  end

  def destroy
    @task = @tasklist.tasks.find(params[:id])
    @task.destroy
    flash[:success] = 'Your task has been deleted'
    redirect_to tasklists_path
  end

  def complete
    @task = @tasklist.tasks.find(params[:id])
    @task.status = true
    @task.save
    redirect_to tasklists_path
  end

  def incomplete
    @task = @tasklist.tasks.find(params[:id])
    @task.status = false
    @task.save
    redirect_to tasklists_path
  end

  def urgent
    @task = @tasklist.tasks.find(params[:id])
    @task.priority = true
    @task.save
    redirect_to tasklists_path
  end

  def normal
    @task = @tasklist.tasks.find(params[:id])
    @task.priority = false
    @task.save
    redirect_to tasklists_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :due_date)
  end

  def prepare_tasklist
    @tasklist = Tasklist.find(params[:tasklist_id])
  end

end
