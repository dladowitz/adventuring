class CoursesController < ApplicationController
  def add_photos
    @organization = Organization.find(params[:organization_id])
    @course = Course.find(params[:id])
    @photo = Photo.new
  end

  def index
    # @courses = Course.paginate(:per_page => 15, :page => params[:page])
    # @courses = get_courses_nearby(location = 'Saratoga, CA, USA', distance_in_mi = 60)
    @courses = Course.text_search(params[:query]).page(params[:page]).per_page(9)
  end

  def new
    @organization = Organization.find(params[:organization_id])
    @course       = Course.new
  end

  def create
    @organization = Organization.find(params[:organization_id])
    @course       = Course.new(params[:course])

    if @course.save
      redirect_to add_photos_organization_course_path(@organization, @course)
    else
      render :new
    end
  end

  def edit
    @organization = Organization.find(params[:organization_id])
    @course       = Course.find(params[:id])
    @photo        = Photo.new
  end

  def update
    @organization = Organization.find(params[:organization_id])
    @course       = Course.find(params[:id])

    if @course.update_attributes(params[:course])
      redirect_to edit_organization_course_path(@organization, @course)
    else
      render :edit
    end
  end

  def destroy
    @organization = Organization.find(params[:organization_id])
    @course       = Course.find(params[:id])

    if @course.destroy
      redirect_to offered_courses_organization_path(@organization)
    else
      render :text => "Could not delete course"
    end
  end

  def show
    @organization = Organization.find(params[:organization_id])
    @course       = Course.find(params[:id])
    @review       = Review.new
  end

  private
    def get_courses_nearby(location = nil, distance_in_mi = nil)
    if location and distance_in_mi
      sections = Section.near(location, distance_in_mi)
      courses = []
      sections.each do |section|
        courses << section.course
      end
      courses
    else
      Course.all
    end
  end

end
