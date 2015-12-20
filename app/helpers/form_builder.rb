class ActionView::Helpers::FormBuilder
  def input(object_name, method)
    "<span>foo</span".html_safe
  end
end