# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController

  def create
   ## check_token method present in model
   if SecretCode.check_token(params[:user][:registration_token])
     build_resource(registration_params)
     if resource.save
       update_registration_token
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
     set_flash_message :alert, 'registration_token_invalid'
   end

  end

  def registration_params
    params.require(:user).permit(:email, :first_name, :last_name,
     :password, :password_confirmation, :registration_token)
  end
  def update_registration_token
  ## associating token with user
    code = SecretCode.find_by(token: params[:user][:registration_token])
      code.update(user_id: resource.id)
  end
end
