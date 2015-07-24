class TasksController < ApplicationController
  def new
    @task = Task.new
    render :show_form
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    authorize! :create, @task
    save_task
  end

  def edit
    @task = Task.find(params[:id])
    authorize! :edit, @task
    render :show_form
  end

  def update
    @task = Task.find(params[:id])
    @task.assign_attributes(task_params)
    authorize! :update, @task
    save_task
  end

  def destroy
    @task = Task.find(params[:id])
    authorize! :destroy, @task
    @task.destroy
    @tasks = Task.all
  end

  private

  def save_task
    if @task.save
      @tasks = Task.all
      render :hide_form
    else
      render :show_form
    end
  end

  def task_params
    params.require(:task).permit(:title, :note, :completed)
  end
end
