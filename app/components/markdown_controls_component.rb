class MarkdownControlsComponent < ViewComponent::Base
  def initialize(input_id, old_value)
    @input_id = input_id
    @old_value = old_value
    super
  end
end
