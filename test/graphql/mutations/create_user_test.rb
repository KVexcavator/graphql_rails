require 'test_helper'

class Mutations::CreateUserTest < ActiveSupport::TestCase
  def perform(args={})
    Mutations::CreateUser.new(object: nil, context: {}).resolve(args)
  end

  test 'create a new user' do
    user = perform(
      name: 'Tony',
      auth_provider:{
        email: {
          email: 'tony@mail.ru',
          password: '[omitted]'
        }
      }
    )

    assert user.persisted?
    assert_equal user.name, 'Tony'
    assert_equal user.email, 'tony@mail.ru'
  end
end