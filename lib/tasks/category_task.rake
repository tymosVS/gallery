# frozen_string_literal: true

namespace :app do
  desc 'This take create new categories!'

  task migrate_images: :environment do
    Category.destroy_all
    Image.destroy_all
    except_dir = ['.', '..']
    categories = []
    Category.new(title: 'Non_categorizated',
                description: 'Images no category').save
    Dir.chdir("#{Rails.root}/app/assets/images")
    Dir.foreach('categories') do |category|
      categories.push(category)  unless except_dir.include?(category)
    end

    categories.each do |category|
      desc = 'Some ' + category + ' images'
      desc += ". " + Faker::Lorem.sentence(word_count: 30)
      current_category = Category.new(title: category,
                                      description: desc)
      current_category.save
      puts 'Create ' + category
      Dir.foreach('categories/' + category) do |image|
        unless except_dir.include?(image)
          file_img = File.open("categories/#{category}/#{image}")
          img = Image.new(title: image[0...-4], image: file_img)
          img.save
          current_category.posts.create(category: current_category,
                                        image: img)
          file_img.close
        end
      end
    end
    puts 'Categories created'
    Image.find_each do |project|
      Image.reset_counters(project.id, :fans)
      Image.reset_counters(project.id, :comments)
    end
  end
end
