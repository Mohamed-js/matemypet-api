require './config'

class Api::V1::UsersController < Api::V1::ApiController
  include UsersHelper
  # before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users/1 or /users/1.json
  def show
    render json: @current_user.to_json(include: { animals: { include: :avatars } })
  end

  # GET /other user
  def show_other
    @user = User.find(params[:id])
    render json: @user.to_json(include: { animals: { include: :avatars } })
  end

  # Update image or info
  def update
    if params[:avatar] && params[:avatar] != ""
      avatar = Cloudinary::Uploader.upload(params[:avatar], use_filename:true, unique_filename:true, overwrite:true)
      @current_user.avatar = avatar['secure_url']
    end
    if params[:location]
      if @current_user.update(country: params[:country], city: params[:city], longitude: params[:longitude], latitude: params[:latitude])
        render json: :updated
      end
    elsif params[:change_profile]
      if @current_user.update(phone: params[:phone])
        render json: :updated
      end
    else
      if @current_user.update(first_name: params[:first_name], last_name: params[:last_name], phone: params[:phone], gender: params[:gender])
        render json: :updated
      end
    end
  end

  def destroy
    if @current_user.destroy
      render json: :deleted
    end
  end

  private
  def user_params
    params.permit(:first_name, :last_name, :gender, :email, :email_verified_at, :password, :token, :otp_code, :avatar, :verified, :blocked, :bio, :longitude, :latitude, :country, :city, :phone)
  end
end
