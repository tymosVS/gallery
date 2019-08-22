ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Last categories" do
          div class:"last-categories" do
            Category.last(5).map do |post|
              span link_to(post.title.capitalize, category_path(post))
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
            div class:"admin_images" do
              Image.last(10).map do |image|
                div class:"admin_image" do
                  div image_tag(image.image.small_thumb.url, alt: 'Image')
                  div image.title
                end
              end
            end
          end
        end
      end
    end
  end # content
end
