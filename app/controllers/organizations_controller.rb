class OrganizationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @orgs = Organization.all
  end

  def new
    @org = Organization.new
  end

  def create
    @org = Organization.new(params[:organization])
    if @org.save
      redirect_to @org
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @org = Organization.find(params[:id])
  end
end
