module Overrides
  # app/controllers/overrides/registrations_controller.rb
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    api :POST, '/auth', 'Create a new :user'
    param :email, String, 'Email of the :user', required: true
    param :password, String, 'Password of the :user', required: true
    param(
      :password_confirmation,
      String,
      'Confirmation of :user\'s password',
      required: true
    )
    param(
      :confirm_success_url,
      String,
      'URL to redirect user after success',
      required: true
    )
    def create
      super
    end

    api :PUT, '/auth/', 'Edit a :user'
    param :current_password, String, 'Password of the :user', required: true
    param :password, String, 'Password of the :user', required: true
    param(
      :password_confirmation,
      String,
      'Confirmation of :user\'s password',
      required: true
    )
    def update
      super
    end
  end
end
