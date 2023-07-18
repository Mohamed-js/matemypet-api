class Api::V1::SessionsController < Api::V1::ApiController
    skip_before_action :authenticate_user

    def create
        @user = User.find_by(email: params[:email])
        unless @user&.authenticate(params[:password])
            return render json: { message: 'There is no such user.' }
        end
        return render json: { token: @user.token, user: @user }, status: :ok
    end
end