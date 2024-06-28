
module Types
    class ThemeType < Types::BaseObject
      
        field :id, ID, null: false
        field :theme_name, String
        field :theme_description, String

    end
  end