require_relative 'base'

class Contributors < Base
  attr_accessor :contributors, :repository

  def initialize
    @contributors = []
  end

  def attrs_parser
    []
  end
end

class Contributor < Base
  attr_accessor :total_commits, :author

  def attrs_parser
    []
  end
end
