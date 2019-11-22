class TasksController < ApplicationController
  before_action :authenticate_user!
  def create
    @task = current_user.tasks.new(task_params)
   
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'User was successfully created.' }
        format.js   {}
        format.json { render json: @task, status: :created, location: @task }
      else
        format.js   {head :no_content, notice: 'task wasnt saved'}
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task=current_user.tasks.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.js   {}
      format.json { head :no_content }
    end
  end

  def check
    @task=current_user.tasks.find(params[:id])
    @task.done=!@task.done
    @task.save
  end

  def edit
    @task=current_user.tasks.find(params[:id])
  end

  def update
    @task=current_user.tasks.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(task_params)
        format.html{}
        format.js{}
        format.json{}
      end
    end
  end

private
  def task_params
    params.require(:task).permit(:name, :project_id, :deadline, :priority)
  end
end
