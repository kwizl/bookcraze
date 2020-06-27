module ApplicationHelper
  def current_user
    @current_user ||= User.find(session[:id])
  end

  def article_most_voted
    hash = Vote.group('article_id').count
    hash.invert.max&.last
  end

  def category_one
    Category.find_by_sql(["SELECT * FROM categories 
      WHERE name = 'Tech' LIMIT 1"])
  end

  def category_two
    Category.find_by_sql(["SELECT * FROM categories 
      WHERE name = 'Food' LIMIT 1"])
  end

  def category_three
     Category.find_by_sql(["SELECT * FROM categories 
      WHERE name = 'Business' LIMIT 1"])
  end

  def category_four
    Category.find_by_sql(["SELECT * FROM categories 
      WHERE name = 'Wildlife' LIMIT 1"])
  end

  def nav(categories)
    html = ''
    categories.each do |c|
      html += <<-HTML
      <div class='menu-item'>
        #{link_to c.name, category_path(c.id)}
      </div>
      HTML
    end
    html.html_safe
  end
end
