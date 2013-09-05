class SectionsController < ApplicationController
  def create
    @organization = Organization.find(params[:organization_id])
    @course = Course.find(params[:course_id])
    @section = Section.new(params[:section])
    if @section.save
      redirect_to :back
    else
      render new
    end
  end

  def destroy
  end

  def edit
    @organization = Organization.find(params[:organization_id])
    @course = Course.find(params[:course_id])
    @section = Section.find(params[:id])
  end

  def new
    @organization = Organization.find(params[:organization_id])
    @course = Course.find(params[:course_id])
    @section = Section.new
  end

  def index
    @organization = Organization.find(params[:organization_id])
    @course = Course.find(params[:course_id])
    @section = Section.new
  end

  def show
    @section = Section.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:organization_id])
    @course = Course.find(params[:course_id])
    @section = Section.find(params[:id])

    if @section.update_attributes(params[:section])
      redirect_to edit_organization_course_path(@organization, @course)
    else
      render new
    end
  end

end
