module CategoriesHelper
  def truncate(text, length = 30, truncate_string = '...')
    return if text.nil?

    l = length - truncate_string.chars.to_a.size
    (text.chars.to_a.size > length ? text.chars.to_a[0...l].join + truncate_string : text).to_s
  end
end
