class CreateGalleriesGalleries < ActiveRecord::Migration

  def up
    create_table :refinery_galleries do |t|
      t.string :title
      t.string :caption
      t.integer :cover_image_id
      t.integer :parent_id, :null => true, :index => true
      t.integer :lft, :null => false, :index => true
      t.integer :rgt, :null => false, :index => true

      # optional fields
      t.integer :depth, :null => false, :default => 0
      t.integer :children_count, :null => false, :default => 0
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-galleries"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/galleries/galleries"})
    end

    drop_table :refinery_galleries

  end

end
