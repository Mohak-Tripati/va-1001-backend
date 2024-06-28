

class Mutations::UpdateUserMapping < Mutations::BaseMutation
    argument :perspective_id, ID, required: true
    argument :user_ids, [ID], required: true
    argument :group_id, ID, required: true
    argument :theme_ids, [ID], required: true

    field :success, Boolean, null: false

  

    field :errors, [String], null: false
  
      
    def resolve(perspective_id:, user_ids:, group_id:, theme_ids:)
    perspective = Perspective.find(perspective_id)
    group = Group.find(group_id)
    
    # Insert into perspective_user_mappings
    user_ids.each do |user_id|
        PerspectiveUserMapping.create!(
        perspective_id: perspective.id,
        user_id: user_id
        )
    end

    # Insert into group_user_mappings
    user_ids.each do |user_id|
        UserGroupMapping.create!(
        group_id: group.id,
        user_id: user_id
        )
    end

    # Insert into theme_user_mappings
    theme_ids.each do |theme_id|
        user_ids.each do |user_id|
        ThemeUserMapping.create!(
            theme_id: theme_id,
            user_id: user_id
        )
        end
    end

    { success: true, errors: [] }
    rescue ActiveRecord::RecordNotFound => e
    { success: false, errors: [e.message] }
    rescue ActiveRecord::RecordInvalid => e
    { success: false, errors: e.record.errors.full_messages }
    end
  end
  


  
  