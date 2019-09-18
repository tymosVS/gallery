# frozen_string_literal: true

namespace :setup do

  desc "Seed the database."
  task :db_seed do
    on roles(:app) do
      within "#{current_path}" do
        with rails_env: :production do
          execute :rake, "db:seed"
        end
      end
    end
  end

  desc "Preload images"
  task :migrate_img do
    on roles(:app) do
      within "#{current_path}" do
        with rails_env: :production do
          execute :rake, "app:migrate_images"
        end
      end
    end
  end

end
