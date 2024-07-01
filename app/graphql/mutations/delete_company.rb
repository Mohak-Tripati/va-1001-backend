class Mutations::DeleteCompany < Mutations::BaseMutation
    argument :id, ID, required: true
  
    field :company, Types::CompanyType, null: true
    field :errors, [String], null: false
  
    def resolve(id:)
      company = Company.find_by(id: id)
      return { company: nil, errors: ['company not found'] } if company.nil?
  
      if company.destroy
        { company: company, errors: [] }
      else
        { company: nil, errors: company.errors.full_messages }
      end
    end
  end
  