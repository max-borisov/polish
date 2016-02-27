class SprintSession
  def initialize session
    @session = session
  end

  def create category_id
    sprint_records = Category.find(category_id).records.active.select(:ru, :pl)
      .map(&:serializable_hash).map { |i| i.merge({ error: 0 }) }
    @session[:sprint] = {
      records: sprint_records,
      index: 1,
      category_id: category_id,
      category_title: category_title(category_id)
    }
  end

  def category_title category_id
    Category.find(category_id).title
  end

  def destroy
    @session.delete(:sprint)
  end

  def symbolize_keys
    @session[:sprint].to_hash.symbolize_keys![:records].map!(&:symbolize_keys)
  end

  def update_error_counter params
    @session[:sprint][:records][params[:record][:id].to_i - 1][:error] = 1
  end

  def update_index
    @session[:sprint][:index] += 1
  end

  def failed_records_count
    @session[:sprint][:records].select{ |i| i[:error] > 0  }.count
  end
end
