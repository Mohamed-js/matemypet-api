class Api::V1::UserReportsController < Api::V1::ApiController
  $report = Report::create(['user_id' => $request->user_id, 'reported_id' => $request->reported_id, 'report' => $request->report,  'reported_type' => $request->reported_type]);
  if ($request->hasFile('img')) {
      $path = cloudinary()->upload($request->file('img')->getRealPath())->getSecurePath();
      $report->img = $path;
  }
  def create
    report = @current_user.user_reports.build(reported_id: params[:reported_id], reported_type: params[:reported_type], body: params[:body])
    if params[:img]
      report.img = Cloudinary::Uploader.upload(params[:img], use_filename:true, unique_filename:true, overwrite:true)
    end

    return render json: :created if report.save
    render json: :failed
  end
end
