module Refinery
  module Galleries
    class Gallery < Refinery::Core::BaseModel
      self.table_name = 'refinery_galleries'
      acts_as_nested_set

      attr_accessible :title, :caption, :cover_image_id, :parent_id, :position

      validates :title, :presence => true, :uniqueness => true

      belongs_to :cover_image, :class_name => '::Refinery::Image'
      belongs_to :parent, :class_name => "Refinery::Galleries::Gallery", :foreign_key => "parent_id"
      has_many :children, :class_name => "Refinery::Galleries::Gallery", :foreign_key => "parent_id"
      has_many :items, :class_name => "Refinery::Galleries::Item", :dependent => :destroy

      scope :top_level, where(:parent_id => nil)
      scope :kids, where("parent_id IS NOT null")

    end
  end
end
