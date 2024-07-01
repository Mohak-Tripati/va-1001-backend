class Mutations::DeleteTheme < Mutations::BaseMutation
    argument :id, ID, required: true
  
    field :theme, Types::ThemeType, null: true
    field :errors, [String], null: false
  
    def resolve(id:)
      theme = Theme.find_by(id: id)
      return { theme: nil, errors: ['theme not found'] } if theme.nil?
  
      if theme.destroy
        { theme: theme, errors: [] }
      else
        { theme: nil, errors: theme.errors.full_messages }
      end
    end
  end
  