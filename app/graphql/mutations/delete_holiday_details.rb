module Mutations
    class DeleteHolidayDetails < Mutations::BaseMutation
      argument :id, ID, required: true
  
      field :holiday_details, Types::HolidayDetailsType, null: true
      field :errors, [String], null: true
  
      def resolve(id:)
        holiday_details = HolidayDetail.find_by(id: id)
        return { holiday_details: nil, errors: ['HolidayDetails not found'] } if holiday_details.nil?
  
        if holiday_details.destroy
          { holiday_details: holiday_details, errors: [] }
        else
          { holiday_details: nil, errors: holiday_details.errors.full_messages }
        end
      end
    end
  end
  