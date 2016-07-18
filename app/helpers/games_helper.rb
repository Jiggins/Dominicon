module GamesHelper
  def grid_view(controller_list)
    if controller_list.nil?
      alert 'danger' do
        concat " is nil"
      end
    else
      content_tag :div, class: 'row masonry-container' do
        controller_list.each do |game|
          grid_item = capture do
            link_to "#{request.path}/#{game.slug}", class: 'game-preview' do
              content_tag :div, class: 'grid-item col-xs-12 col-sm-6 col-md-4' do
                content_tag :div, class: 'panel panel-body' do
                  concat image_tag game.image.url, class: 'img-responsive thumbnail', alt: game.name
                  concat content_tag :h2, sanitize(game.name)
                  concat simple_format truncate game.description, length: 512, separator: '.' 
                end
              end
            end
          end
          concat grid_item
        end
      end
    end
  end
end
