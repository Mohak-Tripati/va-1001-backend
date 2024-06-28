class Mutations::DeletePerspective < Mutations::BaseMutation
    argument :id, ID, required: true
  
    field :perspective, Types::PerspectiveType, null: true
    field :errors, [String], null: false
  
    def resolve(id:)
      perspective = Perspective.find_by(id: id)
      return { perspective: nil, errors: ['perspective not found'] } if perspective.nil?
  
      if perspective.destroy
        { perspective: perspective, errors: [] }
      else
        { perspective: nil, errors: perspective.errors.full_messages }
      end
    end
  end
  