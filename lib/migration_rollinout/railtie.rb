module MigrationRollinout
  class Railtie < Rails::Railtie
    rake_tasks do
      namespace :db do
        desc "migrate/rollback/migrate"
        task :rollinout => :environment do
          Rake::Task['db:migrate'].invoke
          Rake::Task['db:rollback'].invoke
          Rake::Task['db:migrate'].invoke
        end
      end
    end
  end
end
