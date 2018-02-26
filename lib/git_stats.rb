require_relative 'git_stats/mediators/contributors_mediator'

# The main Git Stats driver
class GitStats
  # Get stats CSV file name
  #
  # Example:
  #   >> GitStats.new.git_stats owner: 'Dinda-com-br', repository: 'braspag-rest'
  #   => public/braspag-rest-2018-02-28.txt
  #
  # Arguments:
  #   owner: (String)
  #   repository: (String)
  def git_stats(owner:, repository:)
    contributors_mediator = ContributorsMediator.new(
      owner: owner, repository: repository
    )
    contributors_mediator.generate_csv
  end
end
