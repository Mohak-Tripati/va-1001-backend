class Mutations::CreateTheme < Mutations::BaseMutation
    argument :theme_name, String, required: true
    argument :theme_description, String, required: true
    argument :group_id, ID, required: true
  
  
    # field :user, Types::UserType, null: false
    field :theme, Types::ThemeType, null: false
    field :errors, [String], null: false
  
    def resolve(args)
      theme = Theme.new(args)
      if theme.save
        { theme: theme, errors: [] }
      else
        { theme: nil, errors: theme.errors.full_messages }
      end
    end
  end