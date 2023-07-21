module SuperformAssignment
  private
    # Assigns params to the form model.
    def assign(params, to:, form: form_class)
      to.tap do |model|
        form.new(model).tap do |form|
          # TODO: Figure out how to render this in a way that doesn't concat a string; just throw everything away.
          render_to_string form
          form.assign params
        end
      end
    end

    # Defaults to the form defined in `./app/views/*/form.rb`.
    def form_class
      self.controller_name.camelize.constantize::Form
    end
end