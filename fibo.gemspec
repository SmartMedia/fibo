# encoding: utf-8

spec = Gem::Specification.new do |s|
  s.name = 'fibo'
  s.version = '0.0.2'
  s.summary = "Facebook contest library for Ruby on Rails"
  s.description = "Speed up your facebook contest development"
  s.files = Dir['lib/**/*.rb']
  s.require_path = 'lib'
  s.author = "Josef Simanek"
  s.email = "retro@ballgag.cz"
  s.homepage = "http://github.com/SmartMedia/fibo"

  s.add_dependency('facebooker2')
end
