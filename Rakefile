begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rdoc/task'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Smtp2go::Rails'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.md')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'bundler/gem_tasks'

require 'minitest/test_task'

Minitest::TestTask.create do |t|
  t.framework = %(require "test/test_helper.rb")
  t.libs = %w[test .]
  t.test_globs = ['test/**/*_test.rb']
end


task default: :test
