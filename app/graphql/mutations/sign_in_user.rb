module Mutations
  class SignInUser < BaseMutation
    null true
  
    argument :email, Types::AuthProviderEmailInput, required: false
  
    field :token, String, null: true
    field :user, Types::UserType, null: true
  
    def resolve(email: nil)
      # start  validate
      return unless email
  
      user = User.find_by email: email[:email]
  
      # correct user
      return unless user
      return unless user.authenticate(email[:password])
  
      # use RoR's ActiveSupport::MessageEncryptor, to  token
      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      token = crypt.encrypt_and_sign("user-id:#{ user.id }")
  
      { user: user, token: token }
    end
  end
end