class CoursesController < ApplicationController
  def add_photos
    @organization = Organization.find(params[:organization_id])
    @course = Course.find(params[:id])
    @photo = Photo.new
  end

  def index
    # @courses = Course.paginate(:per_page => 15, :page => params[:page])
    # @courses = get_courses_nearby(location = 'Saratoga, CA, USA', distance_in_mi = 60)

    #used by index page before search form is submitted
    params[:location] = 'Anywhere' unless params[:location]

    #from search form
    #if we don't get a location.
    if params[:location] == 'Anywhere'
      @courses = Course.text_search(params[:query]).paginate(:page => params[:page], :per_page => 9)

    #if we get a location and a query
    elsif params[:query]
      courses_from_search_query = Course.text_search(params[:query])
      @courses = filter_courses_by_location(params[:location], 60, courses_from_search_query).paginate(:page => params[:page], :per_page => 9)

    #if we get a location, but no query
    else
      @courses = get_courses_nearby(params[:location], 60).paginate(:page => params[:page], :per_page => 9)
    end
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

  # private
    def get_courses_nearby(location, distance_in_mi)
      if location && distance_in_mi
        sections = Section.near(location, distance_in_mi)
        courses = []
        sections.each do |section|
          courses << section.course
        end
        courses
      end
    end

    def filter_courses_by_location(location, distance_in_mi, courses)
      puts "starting method"
      puts "number of courses: #{courses.count}"
      filtered_courses = []

      courses.each do |course|
        puts "course name: #{course.name}"
        course.sections.each do |section|
          puts "section location: #{section.location}"
          distance_to_location = section.distance_to(location)

          puts "section.distance_to(location): #{distance_to_location}"

          if distance_to_location && distance_to_location < distance_in_mi
            filtered_courses << section.course
          end
        end
      end

      filtered_courses.uniq
    end
end
