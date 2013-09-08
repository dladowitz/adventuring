class SectionsController < ApplicationController
  def create
    @organization = Organization.find(params[:organization_id])
    @course = Course.find(params[:course_id])
    @section = Section.new(params[:section])
    if @section.save
      redirect_to :back
    else
      redirect_to :back # not sure why I can't get this to render new or index properly
    end
  end

  def destroy
    @organization = Organization.find(params[:organization_id])
    @course = Course.find(params[:course_id])
    @section = Section.find(params[:id])

    if @section.delete
      redirect_to organization_course_sections_path(@organization, @course)
    else
      render edit_organization_course_section_path(@organization, @course, @section)
    end
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
