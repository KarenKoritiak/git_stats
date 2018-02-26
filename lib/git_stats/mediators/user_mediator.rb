require_relative '../services/github/user_service'
require_relative '../builders/user_builder'

class UserMediator
  attr_reader :login

  def initialize(login:)
    @login = login
  end

  def user_details
    user_json = service_step
    builder_step(user_json)
  end

  private

  def service_step
    Github::UserService.new(login: login).call
  end

  def builder_step(user_json)
    UserBuilder.new(user_json).parse
  end
end
