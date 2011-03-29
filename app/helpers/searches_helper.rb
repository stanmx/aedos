module SearchesHelper
  def calculate_days(search)
    (@search.start_date.to_date..@search.end_date.to_date).count - 1
  end

end
