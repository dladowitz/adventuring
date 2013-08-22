class RolesController < ApplicationController
  def new
    @organization = Organization.find(params[:organization_id])
    @role = Role.new
  end

  def create
    @organization = Organization.find(params[:role][:organization_id])

    @user = User.find_by_email(params[:role][:user_id])
    unless @user
      # render :text => 'Something went wrong'
      # redirect_to edit_organization_path(@organization) #not sure why this won't work
      raise "No user by that email address found"
    end
    @role = Role.new
    @role.user_id = @user.id
    @role.permission = params[:role][:permission]
    @role.organization_id = params[:role][:organization_id]
    if @role.save
      redirect_to edit_organization_path(@organization)
    else
      render :text => 'Something went wrong'
    end
  end


  def destroy
    @role = Role.find(params[:id])
    if @role.destroy
      redirect_to :back
    else
      render :text => 'Something went wrong'
    end
  end
end
