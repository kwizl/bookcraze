module ArticlesHelper
  include ApplicationHelper

  def events_list(events)
    html = ''
    events.each do |e|
      html += <<-HTML
      <tr scope="row">
        <td>#{e.name}</td>
        <td>#{e.description}</td>
        <td>#{e.date}</td>
        <td>#{e.creator.name}</td>
        <td>#{link_to 'view', e}</td>
      </tr>
      HTML
    end
    html.html_safe
  end
  def category_articles_helper(categories)
    html = ''
    categories.each do |c|
      html += <<-HTML
      #{image_tag c.thumbnail if c.image.attached?}
      <div class='category-thumbnail-title col-3'>
        #{link_to c.name, category_path(c.id)}
      </div>
      <div class='category-thumbnail-text'>
        <p id='category-text' class='lead'>#{truncate(c.text, 12)}<p>
      </div>
      HTML
    end
    html.html_safe
  end

  def truncate(text, length = 30, truncate_string = "...")
    if text.nil? then return end
    l = length - truncate_string.chars.to_a.size
    (text.chars.to_a.size > length ? text.chars.to_a[0...l].join + truncate_string : text).to_s
  end
end
