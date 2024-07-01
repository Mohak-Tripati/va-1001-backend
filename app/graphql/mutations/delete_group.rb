class Mutations::DeleteGroup < Mutations::BaseMutation
    argument :id, ID, required: true
  
    field :group, Types::GroupType, null: true
    field :errors, [String], null: false
  
    def resolve(id:)
      group = Group.find_by(id: id)
      return { group: nil, errors: ['group not found'] } if group.nil?
  
      if group.destroy
        { group: group, errors: [] }
      else
        { group: nil, errors: group.errors.full_messages }
      end
    end
  end
  