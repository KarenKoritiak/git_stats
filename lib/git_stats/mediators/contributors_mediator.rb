require_relative 'user_mediator'
require_relative '../services/github/contributors_service'
require_relative '../services/csv/contributors_service'
require_relative '../builders/contributors_builder'

class ContributorsMediator
  attr_reader :owner, :repository

  def initialize(owner:, repository:)
    @owner = owner
    @repository = repository
  end

  def generate_csv
    contributors_json = service_step
    contributors = builder_step contributors_json
    users_details_step! contributors
    csv_step! contributors
  end

  private

  def service_step
    Github::ContributorsService.new(
      owner: owner, repository: repository
    ).call
  end

  def builder_step(contributors_json)
    ContributorsBuilder.new(
      repository: repository, json: contributors_json
    ).parse
  end

  def users_details_step!(contributors)
    contributors.contributors.each do |contributor|
      contributor.author.user = UserMediator.new(
        login: contributor.author.login
      ).user_details
    end
  end

  def csv_step!(contributors)
    Csv::ContributorsService.new(
      repository: repository, contributors: contributors
    ).generate!
  end
end
