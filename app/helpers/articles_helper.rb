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
      <div class='col-md-4'>
      #{link_to c.name, category_path(c.id)}
      #{image_tag c.thumbnail if c.image.attached?}
      #{c.text}
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
