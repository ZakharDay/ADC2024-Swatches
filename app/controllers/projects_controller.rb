class ProjectsController < ApplicationController
  load_and_authorize_resource
  before_action :set_project, only: %i[ show edit update destroy ]

  def index
    if current_user && current_user.admin?
      @project = Project.all
    elsif current_user
      @projects = current_user.projects
    else
      @projects = Project.where(public: true)
    end
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = current_user.projects.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_path(@project), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_path(@project), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy!

    respond_to do |format|
      format.html { redirect_to admin_projects_path, status: :see_other, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description)
    end

end