class SprintRecordsController < ApplicationController
  def show
    sprint_session = set_sprint_session
    redirect_to sprints_destroy_path and return if sprint_session.finished?
    @sprint_record = SprintRecord.new(session)
    # redirect_to categories_path if @record.nil?
  end

  def create
    sprint_session = set_sprint_session
    @sprint_record = SprintRecord.new(session, params)
    if @sprint_record.correct_answer?
      index = sprint_session.update_index
      redirect_to sprint_record_path(index)
    else
      sprint_session.update_error_counter
      @error_message = 'Неверный ответ. Попробуйте еще раз.'
      render :show
    end
  end

  private

  def set_sprint_session
    # TODO: do not mutate
    sprint_session = SprintSession.new(session)
    sprint_session.symbolize_keys
    sprint_session
  end

  # TODO: Add params.permit
  #   params.require(:sprint_record).permit(:answer)
  # end
end
