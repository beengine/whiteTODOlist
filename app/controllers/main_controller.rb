class MainController < ApplicationController
  def index
    @projects=Project.all
    @project=Project.new
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

private

  def project_params
    params.require(:project).permit(:name)
  end

end
