class ApplicationForm < Superform::Rails::Form
  include Phlex::Rails::Helpers

  def row(component)
    div do
      render component.field.label(style: "display: block;")
      render component
    end
  end

  def around_template(&)
    error_messages
    super
    submit
  end

  def error_messages
    if model.errors.any?
      div(style: "color: red;") do
        h2 do
          plain pluralize model.errors.count, "error"
          plain "prohibited this post from being saved:"
          ul do
            model.errors.each do |error|
              li { error.full_message }
            end
          end
        end
      end
    end
  end
end
