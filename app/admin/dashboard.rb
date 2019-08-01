ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
  #   div class: "blank_slate_container", id: "dashboard_default_message" do
  #     span class: "blank_slate" do
  #       span I18n.t("active_admin.dashboard_welcome.welcome")
  #       small I18n.t("active_admin.dashboard_welcome.call_to_action")
  #     end
  #   end

    # Here is an example of a simple dashboard with columns and panels.
    #

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
          panel "Last images" do
              Image.last(10).map do |image|
                div do
                  div do
                    image_tag(image.image.small_thumb.url, alt: 'Image')
                  end
                  span image.title
                end
              end
          end
        end
      end

      columns do
        column do
          panel "User actions" do
            div do
              UserAction.all.each do |post|
                div do
                  link_to(post.action, post.action_path) 
                end
                div do
                  if post.action_path != 'nil'
                  link_to(post.action_path, post.action_path) 
                  else
                    '----'
                  end
                end
                div do
                  span User.find(post.user_id).email.to_s 
                  span post.created_at.to_s
                end
              end
            end
          end
        end
      end
    end
  end # content
end
