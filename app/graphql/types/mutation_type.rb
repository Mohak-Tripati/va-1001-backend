# frozen_string_literal: true




module Types
  class MutationType < Types::BaseObject

    field :createUser, mutation: Mutations::CreateUser
    field :editUser, mutation: Mutations::EditUser
    field :deleteUser, mutation: Mutations::DeleteUser

    field :createPerspective, mutation: Mutations::CreatePerspective
    field :updatePerspective, mutation: Mutations::UpdatePerspective
    field :deletePerspective, mutation: Mutations::DeletePerspective

    # company 
    field :createCompany, mutation: Mutations::CreateCompany
    field :updateCompany, mutation: Mutations::UpdateCompany
    field :deleteCompany, mutation: Mutations::DeleteCompany

    # holiday details
    field :createHolidayDetails, mutation: Mutations::CreateHolidayDetails
    field :updateHolidayDetails, mutation: Mutations::UpdateHolidayDetails
    field :deleteHolidayDetails, mutation: Mutations::DeleteHolidayDetails

    # business schedules
    field :createBusinessSchedule, mutation: Mutations::CreateBusinessSchedule
    field :updateBusinessSchedule, mutation: Mutations::UpdateBusinessSchedule
    field :deleteBusinessSchedule, mutation: Mutations::DeleteBusinessSchedule

    # currency
    field :createCurrency, mutation: Mutations::CreateCurrency
    field :updateCurrency, mutation: Mutations::UpdateCurrency
    field :deleteCurrency, mutation: Mutations::DeleteCurrency


    # department



  end
end
