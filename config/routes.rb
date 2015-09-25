Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :galleries do
    resources :galleries, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :galleries, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :galleries, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

  match 'refinery/gallery/:id/items', :to => 'galleries/admin/items#gallery_list', :as => 'gallery_items'
  match 'refinery/gallery/:id/items_test', :to => 'galleries/admin/items#gallery_list_post', :as => 'gallery_items_post'

  # Admin routes
  namespace :galleries, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/galleries" do
      resources :items, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
