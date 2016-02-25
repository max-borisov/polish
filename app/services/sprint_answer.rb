class SprintAnswer
  def right?(session, params)
    default_answer = session[:sprint][:records][params[:record][:id].to_i-1][:pl]
    user_answer = params[:record][:answer]
    default_answer == user_answer
  end
end
