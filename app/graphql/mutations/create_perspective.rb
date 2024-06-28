class Mutations::CreatePerspective < Mutations::BaseMutation
    argument :perspective_name, String, required: true
    argument :perspective_description, String, required: true
  
  
    # field :user, Types::UserType, null: false
    field :perspective, Types::PerspectiveType, null: false
    field :errors, [String], null: false
  
    def resolve(args)
      perspective = Perspective.new(args)
      if perspective.save
        { perspective: perspective, errors: [] }
      else
        { perspective: nil, errors: perspective.errors.full_messages }
      end
    end
  end