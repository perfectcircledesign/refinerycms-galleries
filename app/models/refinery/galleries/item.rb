module Refinery
  module Galleries
    class Item < Refinery::Core::BaseModel

      attr_accessible :title, :caption, :image_id, :gallery_id, :position

      # validates :title, :presence => true, :uniqueness => true

      belongs_to :image, :class_name => '::Refinery::Image'
      belongs_to :gallery, :class_name => '::Refinery::Galleries::Gallery'

    end
  end
end
