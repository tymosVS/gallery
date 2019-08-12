ActiveAdmin.register_page "ImageScraper" do
  content do
    form_for ImageParser.new  do |f|
      f.text_area :site_path
      div do
        f.submit :value => "Parse" 

      end
    # end
    # form_with scope: :image_parser, url: image_parsers_path do |f|
      
    #     f.label :site_path
        
    #     text_field_tag 'site_path'
    #     f.submit :value => "Parse"
    # end
    # form_with scope: :image_parser, url: image_parsers_path do |f|
    #   f.fields "Path" do
    #     f.input :site_path
    #   end
    #   f.submit :value => "Parse"
    end
  end
end
