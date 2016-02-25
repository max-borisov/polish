class SprintRecordsController < ApplicationController
  def show
    SprintSession.new(session).symbolize_keys
    redirect_to sprints_destroy_path and return if sprint_finished?
    @record = session[:sprint][:records][params[:id].to_i-1]
    @records_count = session[:sprint][:records].count
    redirect_to categories_path if @record.nil?
  end

  def create
    sprint_session = SprintSession.new(session)
    sprint_session.symbolize_keys
    if SprintAnswer.new.right?(session, params)
      index = sprint_session.update_index
      redirect_to sprint_record_path(index)
    else
      sprint_session.update_error_counter params
      flash[:alert] = 'Неверный ответ. Попробуйте еще раз.'
      redirect_to sprint_record_path(params[:record][:id])
    end
  end

  private

  def sprint_finished?
    session[:sprint][:index] > session[:sprint][:records].count
  end
end
