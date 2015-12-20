module ApplicationHelper
  def fab_link_to(icon, path, options={})
    options = options.clone
    options[:class] = (options[:class] || '') + ' fab waves-effect waves-light'
    text = "<i class='material-icons'>#{icon}</i>".html_safe
    link_to(text, path, options)
  end

  def form_input(object, field_name)
    object_name = object.class.table_name.singularize # e.g. organization
    id = "#{object_name}_#{field_name}" # e.g. organization_name
    value = object.send(field_name)
    ("<input id='#{id}' name='#{object_name}[#{field_name}]' type='text' class='validate' value='#{value}'>" +
      "<label for='#{id}'>#{field_name.capitalize}</label>").html_safe
  end

  def submit_button
    '<button type="submit" class="btn waves-effect waves">Submit</button>'.html_safe
  end

  def cancel_button(object)
    "<a href='#{url_for(object)}' class='btn-flat waves-effect waves-teal'>Cancel</a>".html_safe
  end
end
