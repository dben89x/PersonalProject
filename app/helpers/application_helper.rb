module ApplicationHelper

  def timezone_convert(time)
    offset = Time.now.utc - Time.now.localtime
    converted_time = time + offset
    converted_time
  end

  def collapsable_cats

  end

  def collapsable_spots(title, message, order_by, classs, &block)
    html = "<a href='#'><h2 data-toggle='collapse' data-target='.#{classs}'>#{title}</h2></a>"
    html += "<div class = 'collapse #{classs}'>"
    html += "<hr>"
    spots_present = false
    @spots.order(order_by).each do |spot|
      if block.call
        spots_present = true
        html += "<div class = 'container jumbotron text-center index-jumbos'>"
        html += "<h3><a href=#{spot_path(spot)}>#{spot.location} @ #{spot.start_time.strftime('%I:%M%p')}</a></h3>"
        html += "<h4> #{spot.description}</h4>"
        html += "<p>with...</p>"
        html += "<h5><a href=#{user_path(spot.user)}>#{spot.user.full_name}</a></h5>"
        html += "</div>"
      end
    end
    if spots_present == false
      html += "<div class = 'container'>#{message}</div>"
    end
    html += "</div>"
    html.html_safe
  end
end
