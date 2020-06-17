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
end
