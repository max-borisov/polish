module SprintRecordsHelper
  def sprint_session_records_count
    session[:sprint][:records].count
  end

  def sprint_session_categoty_title
    session[:sprint][:category_title]
  end
end
