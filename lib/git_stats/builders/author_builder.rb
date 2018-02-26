require_relative 'base_builder'
require_relative '../models/author'

class AuthorBuilder < BaseBuilder
  def parse
    author = Author.new
    send_attributes! author
    author
  end
end
