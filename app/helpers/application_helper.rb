module ApplicationHelper
  def fab_link_to(icon, path, options={})
    options = options.clone
    options[:class] = (options[:class] || '') + ' fab waves-effect waves-light'
    text = "<i class='material-icons'>#{icon}</i>".html_safe
    link_to(text, path, options)
  end
end
