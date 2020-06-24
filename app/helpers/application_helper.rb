module ApplicationHelper
  def current_user
    @current_user ||= User.find(session[:id])
  end

  def article_most_voted
    hash = Vote.group('article_id').count
    hash.invert.max&.last
  end

  def categories_nav
    categories_navbar = Category.find_by_sql(['SELECT name FROM categories GROUP BY name'])
    categories_navbar
  end

  def category_navbar(categories)
    html = ''
    categories.each do |c|
      html += <<-HTML
      <div class='menu-item'>
        #{link_to c.name}
      </div>
      HTML
    end
    html.html_safe
  end
end
