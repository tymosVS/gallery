ActiveAdmin.register ImageParser do
  permit_params :site_path, :id, :image_url

  batch_action :import do |selection|
    ImageParser.find(selection).each do |image_parser|
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
        # ImageParser.new(site_path: params["image_parser"]["site_path"]).save
        flash[:notice] = 'Team created successfully'
        url = params["image_parser"]["site_path"]
        base = URI.parse(url.to_s)
        html = open(url)
        doc = Nokogiri::HTML(html)
        Dir.chdir("#{Rails.root}/public/loads")
        FileUtils.mkdir_p(base.host)
        doc.search('img').each do |img|
          src = img[:src]
          normalized = base.merge(URI.parse(src)).to_s
          # raise dddd
          u = Image.new
          u.image = normalized
          ImageParser.new(site_path: url, image_url: normalized).save
          # filename = Pathname.new(normalized).basename.to_s
          # open(normalized) do |img_file|
          #   File::open(base.host + '/' + filename, 'wb') do |f|
          #     f.write(img_file.read)
          #   end
          # end
        end
        # redirect_back(fallback_location: root_path)
        redirect_to admin_image_parsers_path
        # redirect_to request.referrer
      # end
      end
    
    end
    index do
      selectable_column 
      column :id
      column :image_url do |image|
        img(src:image.image_url)
          # img ('asd')

      end
      column :site_path
      # column("import") { |image| link_to 'Import', create_import_admin_image_parser_path(image.id), method: PUT}
      actions
    end
end
