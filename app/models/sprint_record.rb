class SprintRecord
  attr_accessor :id, :ru, :answer

  def initialize(session, params = nil)
    @id = session[:sprint][:index]
    @ru = session[:sprint][:records][@id-1][:ru]
    @pl = session[:sprint][:records][@id-1][:pl]
    @answer = params[:sprint_record][:answer] || nil if params
  end

  def correct_answer?
    @answer == @pl
  end
end
