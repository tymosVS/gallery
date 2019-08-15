ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Last categories" do
          ul do
            Category.last(5).map do |post|
              li link_to(post.title, categories_path(post))
            end
          end
        end
      end

      columns do
        column do
          panel "Last comments" do
            div do
              Comment.last(5).map do |post|
                div do
                  p link_to(post.title, comments_path(post))
                  p post.body
                end
              end
            end
          end
        end
      end

      columns do
        column do
          section panel "Last images" do
            div class:"admin_images" do
              Image.last(10).map do |image|
                div do
                  div image_tag(image.image.small_thumb.url, alt: 'Image')
                  div image.title
                end
              end
            end
          end
        end
      end
        
    
      
      columns do
        column do
          panel "User actions" do
            # div do
            #   render "search_user"
            # end
            # div do
            #   render "search_action"
            # end
            div class: "container" do
              UserAction.all.each do |post|
                div class: "row" do
                  div class: "col-sm-3" do
                    post.action 
                  end
                  div class: "col-sm-3" do
                    if post.action_path != 'nil'
                    link_to(post.action_path, post.action_path) 
                    else
                      '----'
                    end
                  end
                  div class: "col-sm-3" do
                    span User.find(post.user_id).email.to_s 
                  end
                  div class: "col-sm-3" do
                    span post.created_at.strftime('%Y-%m-%d    %I:%M').to_s
                  end
                end
              end
            end
          end
        end
      end
    end
  end # content
end
