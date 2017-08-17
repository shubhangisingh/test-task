# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController

  def create
   if params[:user][:registration_token].present?
     build_resource(registration_params)
     if resource.save
       if resource.active_for_authentication?
         set_flash_message :notice, :signed_up if is_navigational_format?
         sign_up(resource_name, resource)
         respond_with resource, :location => after_sign_up_path_for(resource)
       else
         set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
         respond_with resource, :location => after_sign_up_path_for(resource)
       end
     else
       clean_up_passwords
       respond_with resource
     end
   else
     redirect_to :new_user_registration
     set_flash_message :alert, 'registration_token_required'
   end

  def registration_params
    params.require(:user).permit(:email, :first_name, :last_name,
      :registration_token, :password, :password_confirmation)
  end

end
end
