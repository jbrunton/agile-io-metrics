module ApplicationHelper
  def fab_link_to(icon, path, options={})
    options = options.clone
    options[:class] = (options[:class] || '') + ' fab waves-effect waves-light'
    text = "<i class='material-icons'>#{icon}</i>".html_safe
    link_to(text, path, options)
  end

  def form_input(object, method)
    input_tag = form_input_tag(object, method)
    label_tag = form_label_tag(object, method)

    [input_tag, label_tag].join.html_safe
  end


  def submit_button(text = 'Submit')
    content_tag :button, text, :class => 'btn waves-effect waves'
  end

  def cancel_button(object)
    content_tag :a, 'Cancel', :href => url_for(object),
        :class => 'btn-flat waves-effect waves-teal'
  end

  def mood_img(mood)
    return '' if mood.nil?
    mood = Mood.classify(mood) unless mood.class == Mood
    tag :img, src: "/moods/#{mood.name}.png"
  end

  def header_for(record)
    content_tag :div, class: 'row' do
      title = content_tag :div, class: 'col s10' do
        content_tag :h3, record.name
      end
      edit_link = content_tag :div, class: 'col s2' do
        content_tag :a, 'Edit',
            href: edit_polymorphic_path(record),
            class: 'btn btn-flat right waves-effect waves-teal'
      end
      title + edit_link
    end
  end

private
  def form_input_tag(object, method)
    object_name = object_name_for(object)
    classes = 'validate'
    classes += ' invalid' if object.errors[method].any?
    tag(:input, :id => input_id_for(object, method),
        :name =>  "#{object_name}[#{method}]",
        :type => 'text',
        :class => classes,
        :value => object.send(method))
  end

  def form_label_tag(object, method)
    attributes = { :for => input_id_for(object, method) }
    attributes.merge!('data-error' => object.errors[method][0]) if object.errors[method].any?
    content_tag(:label, method.capitalize, attributes)
  end

  def input_id_for(object, method)
    object_name = object_name_for(object)
    "#{object_name}_#{method}" # e.g. organization_name
  end

  def object_name_for(object)
    object_name = object.class.table_name.singularize # e.g. organization
  end
end
