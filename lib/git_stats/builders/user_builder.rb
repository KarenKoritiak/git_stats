require_relative 'base_builder'
require_relative '../models/user'

class UserBuilder < BaseBuilder
  def parse
    user = User.new
    send_attributes! user
    user
  end
end
