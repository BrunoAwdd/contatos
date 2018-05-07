# app/inputs/currency_input.rb
class DateFieldInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    "<div class=\"input-group\">
      #{@builder.date_field(attribute_name, merged_input_options)}</div>".html_safe
  end
end