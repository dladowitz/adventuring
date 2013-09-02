class OrganizationsController < ApplicationController
  # before_filter :authenticate_user!

  def your_orgs
    @organizations = current_user.orgs_owned if current_user
  end

  def index
    @organizations = Organization.all
  end

  def new
    @organization = Organization.new
    @review = Review.new
  end

  def create
    @organization = Organization.new(params[:organization])
    if @organization.save
      Role.create(:user_id => current_user.id,
                  :organization_id => @organization.id,
                  :permission => 'owner')
      redirect_to @organization
    else
      render :new
    end
  end

  def edit
    @organization = Organization.find(params[:id])
    @photo = Photo.new

    # Protects unauthorized user from editing organization.
    # Probably need to look at this across many areas and use before filters or find a gem to handle
    render :file => 'public/422.html' unless @organization.permission_levels_for(current_user).include?('owner')
  end

  def update
    @organization = Organization.find(params[:id])

    if @organization.update_attributes(params[:organization])
      redirect_to edit_organization_path(@organization)
    else
      render :new
    end
  end

  def pre_destroy
    @organization = Organization.find(params[:id])
  end

  def destroy
    @organization = Organization.find(params[:id])
    if @organization.destroy
      redirect_to @organization
    else
      render :text => 'Something went wrong'
    end
  end

  def show
    @organization = Organization.find(params[:id])
    @review = Review.new
  end

end
