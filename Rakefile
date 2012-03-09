require 'cucumber/rake/task'

namespace :cuke do
  desc "Run any cuke tests marked as wip"
  Cucumber::Rake::Task.new(:wip) do |t|
    t.cucumber_opts = "-f pretty -t @wip"
    t.libs << 'lib'
  end

  desc "Run any cuke tests marked as complete"
  Cucumber::Rake::Task.new(:complete) do |t|
    t.cucumber_opts = "-f pretty -t @complete"
    t.libs << 'lib'
  end
end
