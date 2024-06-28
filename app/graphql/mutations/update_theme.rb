

class Mutations::UpdateTheme < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :theme_name, String, required: true
    argument :theme_description, String, required: true

  
    field :theme, Types::ThemeType, null: false
    field :errors, [String], null: false
  
    def resolve(args)
      theme = Theme.find_by(id: args[:id])
      return { theme: nil, errors: ['theme not found'] } if theme.nil?
  
      if theme.update(args.except(:id))
        { theme: theme, errors: [] }
      else
        { theme: nil, errors: theme.errors.full_messages }
      end
    end
  end
  