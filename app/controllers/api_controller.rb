class ApiController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  def user_verification
    user = User.find(params[:user_id])
    if current_user
      if current_user != user
        render status: :forbidden, text: 'Invalid User connected'
      end
    else
      render status: :forbidden, text: 'User not connected'
    end
  end
end
