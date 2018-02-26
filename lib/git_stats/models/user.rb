require_relative 'base'

class User < Base
  attr_accessor :name, :email

  def attrs_parser
    %w[name email]
  end
end
