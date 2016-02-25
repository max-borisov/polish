class SprintsController < ApplicationController
  def create
    SprintSession.new(session).create(params[:category_id])
    redirect_to sprint_record_path(1)
  end

  def destroy
    sprint_session = SprintSession.new(session)
    sprint_session.symbolize_keys
    flash[:notice] = "#{sprint_session.failed_records_count} ошибок"
    category_id = session[:sprint][:category_id]
    SprintSession.new(session).destroy
    redirect_to category_path(category_id)
  end
end
