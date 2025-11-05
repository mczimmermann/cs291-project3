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
rails server -b 0.0.0.0 -p 3000
exit
rails server -b 0.0.0.0 -p 3000
exit
cd help_desk_backend
rails server -b 0.0.0.0 -p 3000
rails generate model User id:bigint username:string password_digest:string last_active_at:datetime created_at:datetime updated_at:datetime
rails db:migrate
rails generate model User username:string password_digest:string last_active_at:datetime
rails generate model User username:string password_digest:string last_active_at:datetime
rails generate model User username:string password_digest:string last_active_at:datetime
rails db:migrate
rails db:migrate
rails test
rails test
rails test
rails test
bundle install
rails test
 bin/rails db:environment:set RAILS_ENV=test
rails test
bin/rails db:environment:set RAILS_ENV=test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
exit
rails test
cd help_desk_backend/
rails test
exit
cd help
cd help_desk_backend
rails generate controller Users index show new register edit update destroy
exit
cd help_desk_backend
rails routes
exit
cd help_desk_backend
rails test
rails test
rails test
rails test
rails test
spring stop
bin/rails test
rails generate controller Users register
rails routes
rails test
rails routes
rails test
rails test
exit
cd help_desk_backend
rails test
rails test
rails test
rails test
rails test
rails test
rails test
exit
cd help_desk_backend
rails test
rails test
exit
cd help_desk_backend
rails test
rails test
rails test
rails test
rails test
rails test
exit
cd help_desk_backend
<<<<<<< HEAD
rails generate model ExpertProfile user_id:bigint bio:text knowledge_base_links:json
rails db:migrate
rails test
rails test
rails test
exit
cd help_desk_backend
rails test
rails generate model ExpertAssignment conversation_id:bigint expert_id:bigint status:string assigned_at:datetime resolved_at:datetime
rails db:migrate
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
exit
cd help_desk_backend
rails generate controller Experts queue claim unclaim show update history
exit
cd help_desk_backend
rails test
exit
cd help_desk_backend
rails test
rails test
exit
cd help_desk_backend
rails test
ping -c 1 db
cd ..
bin/rails db:create
db:create
rails db:create
rails db:migrate
rails test
cd help_desk_backend
rails db:migrate
rails test
rails test
clear
rails test
clear
rails test
rails test
rails test
rails test
rails test
rails test
rails test
exit
cd help_desk_backend
rails test
rails test
rails test
rails test
rails test
rails test
rails test
exit
cd help_desk_backend
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
rails test
=======
rails generate controller Health index
rails test
rails db:environment:set RAILS_ENV=test
rails test
rails test
rails test
git add .
git commit -m "Added Health controller + route + tests"
>>>>>>> origin/main
exit
