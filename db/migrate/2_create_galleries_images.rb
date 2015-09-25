class CreateGalleriesItems < ActiveRecord::Migration

  def up
    create_table :refinery_galleries_items do |t|
      t.string :title
      t.string :caption
      t.integer :image_id
      t.integer :gallery_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-galleries"})
    end

    drop_table :refinery_galleries_items

  end

end
