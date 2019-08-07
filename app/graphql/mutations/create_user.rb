module Mutations
  class CreateUser < BaseMutation
    #specific mutation
    class AuthProviderSignupData<Types::BaseInputObject
      argument :email, Type::AuthProviderEmailInput, required: false
    end

    argument :name, String, required: true
    argument :auth_provider, AuthProviderSignupData, required: false

    # return type from the mutatuon
    type Types::UserType

    def resolve(name: nul, auth_provider: nul)
      User.create!(
        name: name,
        email: auth_provider&.[](:email)&.[](:email),
        password: auth_provider&.[](:email)&.[](:password)
      )
    end
  end
end