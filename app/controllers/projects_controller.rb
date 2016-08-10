class ProjectsController < ApplicationController
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

  def update

  end

  def destroy
    @project=Project.find(params[:id])
    @project.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.js   {}
      format.json { head :no_content }
    end
  end

private

  def project_params
    params.require(:project).permit(:name)
  end
end
