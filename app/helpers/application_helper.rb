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
    @s = []
    block.call
    p order_by
    unless @s.empty?
      @s.sort! {|a,b| a.date <=> b.date}
      @s.each do |spot|
        spots_present = true
        html += "<div class = 'container jumbotron text-center index-jumbos'>"
        html += "<h3><a href=#{spot_path(spot)}>#{spot.place.name} @ #{spot.start_time.strftime('%I:%M%p')} on #{spot.date.strftime('%b%-d')}</a></h3>"
        html += "<h4> #{spot.description}</h4>"
        html += "<p>with...</p>"
        spot.attendees.each do |attendee|
          html += "<h5><a href=#{user_path(attendee.user_id)}>#{attendee.user.full_name}</a></h5>"
        end
        html += "#{render partial: '/spots/going_form', locals: {mod: spot.id}}"
        html += "</div>"
      end
    end
    if !spots_present
      html += "<div class = 'container'>#{message}</div>"
    end
    html += "</div>"
    html.html_safe
  end

  def page_header(title, &block)
    content_for(:title, title)
    html = '<div class = "page-header">'.html_safe
    html += '<div class = "pull-right">'.html_safe
    if block
      html += capture do
        block.call
      end
    end
    html += '</div>'.html_safe
    html += '<h1>'.html_safe
    html += title
    html += '</h1>'.html_safe
    html += '</div>'.html_safe

    html
  end
end
