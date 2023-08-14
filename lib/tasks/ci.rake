namespace :bundle do
  desc "Check dependencies for known vulnerabilites"
  task :audit do
    sh "bundle exec bundle-audit check -u"
  end

  desc "Check dependencies for known memory leaks"
  task :leak do
    sh "bundle exec bundle-leak check -u"
  end
end

desc "Scans application for vulnerabilities"
task :brakeman do
  sh "bundle exec brakeman -q --no-pager"
end

desc "Run static analysis code quality report"
task :rubycritic do
  sh "bundle exec rubycritic"
end

namespace :test do
  desc "Runs standard bundle:audit, bundle:leak, brakeman, rubycritic, and test:all"
  task ci: %i[standard bundle:audit bundle:leak brakeman test:all rubycritic] do
  end
end
