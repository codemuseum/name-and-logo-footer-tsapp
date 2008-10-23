class CreateFooters < ActiveRecord::Migration
  def self.up
    create_table :footers do |t|
      t.string :organization_uid
      t.string :title
      t.string :subtitle
      t.string :layout
      t.string :phone
      t.string :url
      t.string :asset_type
      t.string :asset_urn

      t.timestamps
    end
    add_index :footers, :organization_uid
  end

  def self.down
    drop_table :footers
  end
end
