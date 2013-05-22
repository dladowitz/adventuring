class OrganizationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @orgs = Organization.all
  end

  def new
    @org = Organization.new
    @review = Review.new
  end

  def create
    @org = Organization.new(params[:organization])
    if @org.save
      Role.create(:user_id => current_user.id,
                  :organization_id => @org.id,
                  :permission => 'owner')
      redirect_to @org
    else
      render :new
    end
  end

  def edit
    @org = Organization.find(params[:id])
  end

  def update
    @org = Organization.find(params[:id])

    if @org.update_attributes(params[:organization])
      redirect_to @org
    else
      render :new
    end
  end

  def pre_destroy
    @org = Organization.find(params[:id])
  end

  def destroy
    @org = Organization.find(params[:id])
    if @org.delete
      redirect_to @org
    else
      render :text => 'Something went wrong'
    end
  end

  def show
    @org = Organization.find(params[:id])
    @review = Review.new
  end
end
