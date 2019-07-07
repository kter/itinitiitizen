class ReportsController < ApplicationController
  before_action :require_login, only: [:count]

  def count
    report = Report.find_or_initialize_by(zens_id: params[:zens_id])
    binding.pry
    report.increment(:report_count, 1)
    # report.zens_id = params[:zens_id]
    if report.save then
      respond_to do |format|
        format.html { redirect_to zens_url, notice: t(:zen_reported) }
        format.json { head :no_content }
      end
    end
  end

  private
    def require_login
      unless current_user
        redirect_to zens_path, notice: "ログインする必要があります"
      end
    end
end