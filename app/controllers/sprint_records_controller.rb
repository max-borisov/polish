class SprintRecordsController < ApplicationController
  def show
    sprint_session = SprintSession.new(session)
    # TODO: do not mutate
    sprint_session.symbolize_keys
    redirect_to sprints_destroy_path and return if sprint_session.finished?
    @sprint_record = SprintRecord.new(session)
    # redirect_to categories_path if @record.nil?
  end

  def create
    sprint_session = SprintSession.new(session)
    sprint_session.symbolize_keys
    @sprint_record = SprintRecord.new(session, params)
    if @sprint_record.correct_answer?
      index = sprint_session.update_index
      redirect_to sprint_record_path(index)
    else
      @error_message = 'Невеный ответ. Попробуйте еще раз.'
      render :show
    end
  end

  private

  # TODO: Add params.permit
  #   params.require(:sprint_record).permit(:answer)
  # end
end
