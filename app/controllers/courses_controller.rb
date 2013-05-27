class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @org = Organization.find(params[:organization_id])
    @course = Course.new
  end

  def create
    @org = Organization.find(params[:organization_id])
    @course = Course.new(params[:course])
    if @course.save
      redirect_to organization_course_path(@org, @course)
    else
      render :new
    end
  end

  def edit
    @org = Organization.find(params[:organization_id])
    @course = Course.find(params[:id])
    @photo = Photo.new
  end

  def update
    @org = Organization.find(params[:organization_id])
    @course = Course.find(params[:id])

    if @course.update_attributes(params[:course])
      redirect_to organization_course_path(@org, @course)
    else
      render :edit
    end
  end

  def destroy
    @org = Organization.find(params[:organization_id])
    @course = Course.find(params[:id])
    if @course.destroy
      redirect_to organization_path(@org)
    else
      render :text => "Could not delete course"
    end
  end

  def show
    @org = Organization.find(params[:organization_id])
    @course = Course.find(params[:id])
  end
end
