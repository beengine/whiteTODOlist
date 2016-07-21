class MainController < ApplicationController
  def index
    @projects=Project.all
    @project=Project.new
    @task=Task.new
  end

  def create
  @project = Project.new(project_params)
 
  respond_to do |format|
    if @project.save
      format.html { redirect_to @project, notice: 'User was successfully created.' }
      format.js   {}
      format.json { render json: @project, status: :created, location: @project }
    else
      format.html { render action: "new" }
      format.json { render json: @project.errors, status: :unprocessable_entity }
    end
  end
end

def create_task
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


private

  def project_params
    params.require(:project).permit(:name)
  end

  def task_params
    params.require(:task).permit(:name, :project_id)
  end

end
