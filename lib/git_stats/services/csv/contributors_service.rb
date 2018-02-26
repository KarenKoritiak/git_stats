require 'csv'

module Csv
  class ContributorsService
    attr_reader :repository, :contributors

    def initialize(repository:, contributors:)
      @repository = repository
      @contributors = contributors
    end

    def generate!
      generate_file!
      file_path
    end

    private

    def file_path
      @file_path ||= "/tmp/#{repository}-#{datetime_formated}.txt"
    end

    def datetime_formated
      Time.now.strftime '%Y%m%d%H%M%S'
    end

    def generate_file!
      CSV.open(file_path, 'wb', col_sep: ';') do |csv|
        major_contributors.each do |contributor|
          csv << generate_row(contributor)
        end
      end
    end

    def major_contributors
      contributors.contributors.sort_by(&:total_commits).reverse
    end

    def generate_row(contributor)
      [
        contributor.author.user.name,
        contributor.author.user.email,
        contributor.author.login,
        contributor.author.avatar_url,
        contributor.total_commits
      ]
    end
  end
end
