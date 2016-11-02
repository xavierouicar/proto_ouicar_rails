module Overrides
  # app/controllers/overrides/sessions_controller.rb
  class SessionsController < DeviseTokenAuth::SessionsController
    api :POST, '/auth/sign_in', 'Sign in as the :user'
    param :email, String, 'Email of the :user'
    param :password, String, 'Password of the :user'
    def create
      super
    end

    api :DELETE, '/auth/sign_out', 'Sign out the session'
    def destroy
      super
    end
  end
end
