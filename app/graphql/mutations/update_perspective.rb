

class Mutations::UpdatePerspective < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :perspective_name, String, required: true
    argument :perspective_description, String, required: true

  
    field :perspective, Types::PerspectiveType, null: false
    field :errors, [String], null: false
  
    def resolve(args)
      perspective = Perspective.find_by(id: args[:id])
      return { perspective: nil, errors: ['Perspective not found'] } if perspective.nil?
  
      if perspective.update(args.except(:id))
        { perspective: perspective, errors: [] }
      else
        { perspective: nil, errors: perspective.errors.full_messages }
      end
    end
  end
  