namespace :app do
  desc "This take create new categories!"

  task :migrate_images => :environment do |t, args|
    Category.destroy_all
    Image.destroy_all
    except_dir = ['.', '..']
    categories = []

    Dir.chdir("#{Rails.root}/lib/assets")
    Dir.foreach('categories') do |category| 
      categories.push(category) if !except_dir.include?(category)
    end

    categories.each do |category|
      desc = 'Some ' + category + ' images'
      current_category = Category.new(title: category, description: desc)
      current_category.save
      puts 'Create ' + category
      Dir.foreach('categories/' + category) do |image|
          if !except_dir.include?(image)
            file_img = File.open("categories/#{category}/#{image}") 
            img = Image.new(title: image[0...-4], image:file_img)
            img.save
            current_category.posts.create(:category=>current_category, :image=>img)
            file_img.close
          end
      end
    end
    puts "Categories created"
  end
end
