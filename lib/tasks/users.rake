namespace :users do
  desc "Make users with the given id(s) admin"
  task make_admin: :environment do
    fail "Usage: rake users:make_admin USER_ID [USER_ID...]" if ARGV.empty?
    ARGV.each { |arg| task arg.to_sym {} }
    User.find(ARGV).each(&:make_admin!)
  end

  desc "Revoke admin status from users with the given id(s)"
  task revoke_admin: :environment do
    fail "Usage: rake users:revoke_admin USER_ID [USER_ID...]" if ARGV.empty?
    ARGV.each { |arg| task arg.to_sym {} }
    User.find(ARGV).each(&:revoke_admin!)
  end
end
