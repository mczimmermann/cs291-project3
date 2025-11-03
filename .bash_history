gem install rails
gem update --system 3.7.3
gem update --system 3.7.2
rails -v
rails new help_desk_backend --api --skip-kamal --skip-thruster  --database=mysql
cd help_desk_backend
gem "rack-cors"
gem "jwt"
gem "activerecord-session_store"
group :test do
   gem "mocha"
end
bundle install
rails db:create
rails server -b 0.0.0.0 -p 3000
exit
rails generate active_record:session_migration
cd help_desk_backend
rails generate active_record:session_migration
rails db:migrate
exit
