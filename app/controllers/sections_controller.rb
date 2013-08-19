class SectionsController < ApplicationController
  def new
    @org = Organization.find(params[:organization_id])
    @course = Course.find(params[:course_id])
    @section = Section.new
  end

  def create
    @org = Organization.find(params[:organization_id])
    @course = Course.find(params[:course_id])
    @section = Section.new(params[:section])
    if @section.save
      redirect_to edit_organization_course_path(@org, @course)
    else
      render new
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def index
  end

  def destroy
  end
end
