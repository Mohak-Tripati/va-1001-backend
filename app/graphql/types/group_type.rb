
module Types
    class GroupType < Types::BaseObject
      
        field :id, ID, null: false
        field :group_name, String
        field :group_description, String
        field :themes, [Types::ThemeType], null: true

    end
  end