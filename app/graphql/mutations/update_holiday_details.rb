module Mutations
  class UpdateHolidayDetails < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :year, Integer, required: true
    argument :holiday_name, String, required: true
    argument :holiday_date, GraphQL::Types::ISO8601Date, required: true
    argument :perspective_id, ID, required: true

    field :holiday_details, Types::HolidayDetailsType, null: false
    field :errors, [String], null: false

    def resolve(**args)
      holiday_details = HolidayDetail.find_by(id: args[:id])
      return { holiday_details: nil, errors: ['HolidayDetails not found'] } if holiday_details.nil?

      perspective = Perspective.find_by(id: args[:perspective_id])
      return { holiday_details: nil, errors: ['Perspective not found'] } if perspective.nil?

      if holiday_details.update(args.except(:id, :perspective_id))
        { holiday_details: holiday_details, errors: [] }
      else
        { holiday_details: nil, errors: holiday_details.errors.full_messages }
      end
    end
  end
end
