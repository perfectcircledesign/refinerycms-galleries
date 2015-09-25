module Refinery
  module Galleries
    module Admin
      class ItemsController < ::Refinery::AdminController

        crudify :'refinery/galleries/item',
                :xhr_paging => false, :per_page => 100000

        def gallery_list
          @gallery = Refinery::Galleries::Gallery.find(params[:id])
          @items = @gallery.items
          @item = Refinery::Galleries::Item.new
          render_partial_response?
        end

        def destroy
          @item = Refinery::Galleries::Item.find(params[:id])
          if @item.destroy
            flash.notice = t('destroyed', :scope => 'refinery.crudify', :what => "#{@item.id}")
          end
          redirect_to :back
        end

        def create

          raise
          if params[:item][:image].present?
            images = params[:item][:image]
            gallery_id = params[:item][:gallery_id]

            # looping thought images
            images.each do |image|
              #first create refinery image then assign it to the gallery Item
              img = Refinery::Image.new
              img.image = image
              img.save!

              item = Refinery::Galleries::Item.new
              item.image_id = img.id
              item.gallery_id = gallery_id
              item.save!
            end
            redirect_to :back
          else
            if (@item = Refinery::Galleries::Item.create(params[:items])).valid?
              flash.notice = t(
                  'refinery.crudify.created',
                  :what => "'\#{@#{item}.#{options[:title_attribute]}}'"
              )
              create_or_update_successful
            else
              create_or_update_unsuccessful 'new'
            end
          end

        end

      end
    end
  end
end
