class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @organization = Organization.find(params[:photo][:organization_id]) if params[:photo][:organization_id]
    @course = Course.find(params[:photo][:course_id]) if params[:photo][:course_id]
    @photo = Photo.new(params[:photo])
    if @photo.save
      redirect_to :back
    else
      render :new
    end
  end

  def edit
  end

  def update
    @course = Course.find(params[:photo][:course_id]) if params[:photo][:course_id]
    @photo = Photo.find(params[:id])

    if @photo.update_attributes(params[:photo])
      redirect_to :back
    else
      render :new
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.destroy
      redirect_to :back
    else
      render :text => 'Could not delete'
    end
  end

  def show
  end
end
