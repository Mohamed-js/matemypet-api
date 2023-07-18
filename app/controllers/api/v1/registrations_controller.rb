class Api::V1::RegistrationsController < Api::V1::ApiController
    skip_before_action :authenticate_user, only: %i[create]

    include UsersHelper
    def create
        # User already exists
        @user = User.find_by(email: params[:email])
        return render json: {message: 'User already exists.'}, status: :unprocessable_entity if @user

        # User not found, => create User
        @user = User.new(email: params[:email], password: params[:password])
        tokenize! @user
        create_otp @user
        if @user.save
            @user.create_subscription Tier.first
            return render json: {message: "We've sent OTP code to your email, please check.", token: @user.token, user: @user}, status: :ok 
        end 

        # User has errors
        render json: {message: @user.errors.full_messages}, status: :unprocessable_entity unless @user.valid?
    end

    def verify_otp
        if @current_user.otp_code == params[:otp]
            @current_user.update(verified: true)
            return render json: :approved, status: :ok 
        end
        render json: :not_approved
    end

    def resend_otp
        create_otp @current_user
        render json: {message: "We've sent OTP code to your email, please check.", token: @user.token}, status: :ok
    end

    def create_profile
        avatar = Cloudinary::Uploader.upload(user_params[:avatar], use_filename:true, unique_filename:true, overwrite:true)
        # @current_user.avatar = avatar.public_path
        if @current_user.update(user_params.except(:avatar))
            render json: {message: "Created successfully."}
        end
    end


    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :gender, :avatar, :phone)
    end

    def location_params
        params.require(:user).permit(:country, :city, :longitude, :latitude)
    end
end