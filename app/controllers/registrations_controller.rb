class RegistrationsController < Devise::RegistrationsController
  def update
    @user = User.find(current_user.id)

    successfully_updated = if needs_password?(@user, params)
      @user.update_with_password(params[:user])
    else
      # remove the virtual current_password attribute update_without_password
      # doesn't know how to ignore it
      params[:user].delete(:current_password)
      @user.update_without_password(params[:user])
    end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      # redirect_to after_update_path_for(@user)
      redirect_to profile_path(current_user)
    else
      render "edit"
    end
  end

  private

  # Check if the user's current password is needed when changing user attributes.
  # Currently a password is only needed when changing a users password.
  # Add other attributes to the method if needed (ex: user.email != params[:user][:email] )
  def needs_password?(user, params)
      params[:user][:password].present?
  end
end
