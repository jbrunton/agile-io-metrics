module ApplicationHelper
  def fab_link_to(icon, path, options={})
    options = options.clone
    options[:class] = (options[:class] || '') + ' fab waves-effect waves-light'
    text = "<i class='material-icons'>#{icon}</i>".html_safe
    link_to(text, path, options)
  end

  def form_input(object, method)
    object_name = object.class.table_name.singularize # e.g. organization
    input_id = "#{object_name}_#{method}" # e.g. organization_name

    input_tag = form_input_tag(input_id, "#{object_name}[#{method}]", object.send(method))
    label_tag = form_label_tag(input_id, method)

    [input_tag, label_tag].join.html_safe
  end


  def submit_button
    '<button type="submit" class="btn waves-effect waves">Submit</button>'.html_safe
  end

  def cancel_button(object)
    "<a href='#{url_for(object)}' class='btn-flat waves-effect waves-teal'>Cancel</a>".html_safe
  end

private
  def form_input_tag(input_id, field_name, value)
    tag(:input, :id => input_id,
        :name => field_name,
        :type => 'text',
        :class => 'validate',
        :value => value)
  end

  def form_label_tag(input_id, method)
    content_tag(:label, method.capitalize, :for => input_id)
  end
end
