Gem::Specification.new do |s|
  s.name        = 'git_stats'
  s.version     = '1.0.0'
  s.date        = '2018-02-28'
  s.summary     = 'Git Stats'
  s.description = 'Provides git stats from a repository order by major contributors'
  s.authors     = ['Karen Koritiak']
  s.email       = 'karen.koritiak@gmail.com'
  s.files       = ['lib/git_stats.rb', 'lib/git_stats/services/github/contributors_service.rb']
  s.license     = 'MIT'

  s.add_development_dependency 'faker'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop'
end
