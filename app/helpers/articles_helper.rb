module ArticlesHelper
  include ApplicationHelper
  
  def category_articles_helper(categories)
    html = ''
    categories.each do |c|
      html += <<-HTML
      <div id="category-img">
        #{image_tag c.thumbnail if c.image.attached?}
        <div class='category-thumbnail-title ml-2 mr-2'>
          #{link_to c.name, category_path(c.id)}
        </div>
        <div class='category-thumbnail-text ml-2 mr-2'>
          <p id='category-text' class='lead'>#{truncate(c.text, 80)}<p>
        </div>
      </div>
      HTML
    end
    html.html_safe
  end

  def truncate(text, length = 30, truncate_string = '...')
    return if text.nil?

    l = length - truncate_string.chars.to_a.size
    (text.chars.to_a.size > length ? text.chars.to_a[0...l].join + truncate_string : text).to_s
  end
end
