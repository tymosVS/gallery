class ImageParsersController < ApplicationController
  def index

  end
  def create
    access_type = ['.png', '.jpg', '.jpeg']
    url = params["image_parser"]["site_path"]
    base = URI.parse(url.to_s)
    html = open(url)
    doc = Nokogiri::HTML(html)
    Dir.chdir("#{Rails.root}/public/loads")
    FileUtils.mkdir_p(base.host)
    doc.search('img').each do |img|
      src = img[:src]
      normalized = base.merge(URI.parse(src)).to_s
      # session[:c] << normalized
      ImageParser.new(site_path: url, image_url: normalized).save
      filename = Pathname.new(normalized).basename.to_s
      if access_type.map {|e| normalized.include?(e)}.any?{|type| type}
        # open(normalized) do |img_file|
        #   # File::open(base.host + '/' + filename, 'wb') do |f|
        #   #   f.write(img_file.read)
            
        #   # end
        #   # file_img = File::open(base.host + '/' + filename)
          
        #   # img = Image.new(title: filename, image:file_img)
        #   # img.save
        #   # current_category = Category.where(title: "Non_categorizated").first
        #   # current_category.posts.create(:category=>current_category, :image=>img)
        #   # file_img.close
        # end
      end
    end
  FileUtils.rm_r(base.host)
  redirect_back(fallback_location: root_path)
  end

end
