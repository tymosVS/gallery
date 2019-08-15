ActiveAdmin.register_page "ImageScraper" do

  def load 
    ImageParser.delete_all
  end

  content do
    render partial: "form"
    
    ImageParser.all.each do |s|
        img(src: s.image_url)
        form do |f|
          f.input :value=>s.id, :type => :hidden
          f.button("load")
        end
      end
      
    end



end
