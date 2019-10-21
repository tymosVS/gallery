ActiveAdmin.register ImageParser do
  permit_params :site_path, :id, :image_url

  batch_action :import do |selection|
    current_category = Category.where(title: 'Non_categorizated').first
    unless current_category
      current_category = Category.new(title: 'Non_categorizated', 
                                      description: 'Images no category') 
      current_category.save
    end

    ImageParser.find(selection).each do |image_parser|
      normalized = URI.parse(image_parser.image_url)
      filename = Pathname.new(normalized.to_s).basename
      img = Image.new(title: filename, remote_image_url: image_parser.image_url)
      img.save
      current_category.posts.create(category: current_category, image: img)
      image_parser.destroy
    end
    redirect_to admin_image_parsers_path 
  end

  form title: 'Create ImageParser' do |f|
    f.inputs 'ImageLoaders' do
      input :site_path
    end
    actions
  end

  controller do

    def create
      flash[:notice] = 'Team created successfully'
      url = params['image_parser']['site_path']
      base = URI.parse(url.to_s)
      html = open(url)
      doc = Nokogiri::HTML(html)
      doc.search('img').each do |img|
        if img[:src]
          src = img[:src]
          normalized = base.merge(URI.parse(src)).to_s
          u = Image.new
          u.image = normalized
          if normalized =~ /(\.((jpg)|(png)|(jpeg)))$/
            ImageParser.new(site_path: url, image_url: normalized).save
          end
        end
      end
      redirect_to admin_image_parsers_path
    end
  end

    index do
      selectable_column 
      column :id
      column :image_url do |image|
        img(src:image.image_url)
      end
      column :site_path
      actions
    end
end
