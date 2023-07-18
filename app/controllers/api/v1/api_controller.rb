class Api::V1::ApiController < ActionController::Base
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user

    private
    def authenticate_user
        authoriztion_header = request.headers["Authorization"]
        return render json: :authentication_error unless authoriztion_header
        token = authoriztion_header[7..authoriztion_header.length]
        @current_user = User.find_by token: token
        return render json: {message: "You are not authorized."}, status: :unauthorized unless @current_user
    end
end
