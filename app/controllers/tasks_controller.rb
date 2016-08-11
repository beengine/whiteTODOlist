class TasksController < ApplicationController
  def create
    @task = Task.new(task_params)
   
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'User was successfully created.' }
        format.js   {}
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task=Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.js   {}
      format.json { head :no_content }
    end
  end

  def check
    @task=Task.find(params[:id])
   @task.done=!@task.done
   @task.save
  end

private
  def task_params
    params.require(:task).permit(:name, :project_id, :deadline, :priority)
  end
end