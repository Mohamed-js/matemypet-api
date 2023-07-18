class Api::V1::UserReportsController < Api::V1::ApiController
  def create
    report = @current_user.user_reports.build(reported_id: params[:reported_id], reported_type: params[:reported_type], body: params[:body])
    if params[:img]
      report.img = Cloudinary::Uploader.upload(params[:img], use_filename:true, unique_filename:true, overwrite:true)
    end

    return render json: :created if report.save
    render json: :failed
  end
end
