

class Mutations::UpdateGroup < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :group_name, String, required: true
    argument :group_description, String, required: true

  
    field :group, Types::GroupType, null: false
    field :errors, [String], null: false
  
    def resolve(args)
      group = Group.find_by(id: args[:id])
      return { group: nil, errors: ['group not found'] } if group.nil?
  
      if group.update(args.except(:id))
        { group: group, errors: [] }
      else
        { group: nil, errors: group.errors.full_messages }
      end
    end
  end
  