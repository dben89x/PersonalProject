module ApplicationHelper

  def timezone_convert(time)
    offset = Time.now.utc - Time.now.localtime
    converted_time = time + offset
    converted_time
  end

end
