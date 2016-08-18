class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects=Project.where(user_id: current_user.id).order(id: :desc).all
    @project=Project.new
    @task=Task.new
  end

  def create
  @project = Project.new(project_params)
  @project.user_id = current_user.id
 
  respond_to do |format|
    if @project.save
      format.html { redirect_to @project, notice: 'User was successfully created.' }
      format.js   { @task=Task.new }
      format.json { render json: @project, status: :created, location: @project }
    else
      format.html { render action: "new" }
      format.json { render json: @project.errors, status: :unprocessable_entity }
    end
  end
end

  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(project_params)
        format.html { redirect_to(@project, :notice => 'Project was successfully updated.') }
        format.js   {}
        format.json { respond_with_bip(@project) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@project) }
      end
    end
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
