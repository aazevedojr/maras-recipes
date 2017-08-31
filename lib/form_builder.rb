class ActionView::Helpers::FormBuilder
  def from_recipe?(recipe)
    object.recipe == recipe
  end
end
