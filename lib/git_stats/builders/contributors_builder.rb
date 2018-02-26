require_relative 'base_builder'
require_relative 'author_builder'
require_relative '../models/contributors'

class ContributorsBuilder < BaseBuilder
  attr_reader :repository

  def initialize(repository:, json:)
    @json = json
    @repository = repository
  end

  def parse
    contributors = Contributors.new
    json.each do |contributor_json|
      contributors.contributors << ContributorBuilder.new(contributor_json).parse
    end
    contributors.repository = repository
    contributors
  end

  class ContributorBuilder < BaseBuilder
    def parse
      contributor = Contributor.new
      contributor.author = AuthorBuilder.new(json['author']).parse
      contributor.total_commits = json['total']
      contributor
    end
  end
end
