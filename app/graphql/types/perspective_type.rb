
module Types
    class PerspectiveType < Types::BaseObject
      
        field :id, ID, null: false
        field :perspective_name, String
        field :perspective_description, String

    end
  end