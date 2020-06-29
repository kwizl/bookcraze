module ApplicationHelper
  def current_user
    @current_user ||= User.find(session[:id])
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

  def notice_helper
    html = ''
    if notice.present?
      html += <<-HTML
      <div class="notice">
        <p> #{notice} </p>
      </div>
      HTML
    end
    html.html_safe
  end

  def alert_helper
    html = ''
    if alert.present?
      html += <<-HTML
      <div class="alert">
        <p> #{alert}</p>
      </div>
      HTML
    end
    html.html_safe
  end

  def error_html(object)
    html = ''
    object.errors.full_messages.each do |msg|
      html += <<-HTML
      <li>#{msg}</li>
      HTML
    end
    html.html_safe
  end

  def error_helper(object)
    html = ''
    if object.errors.any?
      html += <<-HTML
      <div id="error_explanation">
        <div class="alert alert-danger">
          The form contains
          #{pluralize(object.errors.count, "error")}.
        </div>
        <ul>
          #{error_html(object)}
        </ul>
      <div>
      HTML
    end
    html.html_safe
  end

  def session_menu
    html = ''
    if session[:name]
    html += <<-HTML
      <div class="menu-item">
        #{link_to 'Write Article', new_article_path}
      </div>
      <div class='menu-item'>
        #{nav(category_one)}
      </div>
      <div class='menu-item'>
         #{nav(category_two)}
      </div>
      <div class='menu-item'>
        #{nav(category_three)}
      </div>
      <div class='menu-item'>
        #{nav(category_four)}
      </div>
      HTML
    end
    html.html_safe
  end

  def session_logout
    html = ''
    if session[:name]
    html += <<-HTML
      <li class="nav-item">#{current_user.name}</li>
      <li class="nav-item pl-3">#{link_to 'Logout', logout_path}</li>
    HTML
    else
    html += <<-HTML
      #{session_login}
    HTML
    end
    html.html_safe
  end

  def session_login
    html = ''
    html += <<-HTML
      <li id='logout-link' class="nav-item">#{link_to 'Login ', login_path}|</li>
      <li class="nav-item">#{link_to ' Register', new_user_path}</li>
    HTML
    html.html_safe
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
end
