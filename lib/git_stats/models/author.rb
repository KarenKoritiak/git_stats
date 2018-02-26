require_relative 'base'

class Author < Base
  attr_accessor :login, :avatar_url, :user

  def attrs_parser
    %w[login avatar_url]
  end
end
