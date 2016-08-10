class TasksController < ApplicationController
  def create
    @task = Task.new(task_params)
   
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'User was successfully created.' }
        format.js   {}
        format.json { render json: @task, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def check
  # Task.find(params.fetch(:id)).done=true
    puts 'dyjd'
    puts params
  end

private
  def task_params
    params.require(:task).permit(:name, :project_id, :deadline, :priority)
  end
end