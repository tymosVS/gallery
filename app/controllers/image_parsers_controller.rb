class ImageParsersController < ApplicationController
  def index

  end
  def create
    url = params["image_parser"]["site_path"]
    base = URI.parse(url.to_s)
    html = open(url)
    doc = Nokogiri::HTML(html)
    Dir.chdir("#{Rails.root}/public/loads")
    FileUtils.mkdir_p(base.host)
    doc.search('img').each do |img|
      src = img[:src]
      normalized = base.merge(URI.parse(src)).to_s

      filename = Pathname.new(normalized).basename.to_s
      
      open(normalized) do |img_file|
        
        File::open(base.host + '/' + filename, 'wb') do |f|
          f.write(img_file.read)
        end
      end
end
# FileUtils.rm_r(base.host)
  end
  
  
end
