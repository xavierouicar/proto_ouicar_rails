class ApiController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

  # ParamError is superclass of ParamMissing, ParamInvalid
  rescue_from Apipie::ParamError do |e|
    render text: e.message, status: :unprocessable_entity
  end

  def user_verification
    user = User.find(params[:user_id])
    if current_user
      if current_user != user
        render status: :unauthorized, text: 'Invalid User connected'
      end
    else
      render status: :unauthorized, text: 'User not connected'
    end
  end
end
