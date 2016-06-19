class CreateCreatives < ActiveRecord::Migration
  def change
    create_table :creatives do |t|
      t.decimal :bid,
        precision: 12,
        scale: 2,
        null: false

      t.text :ad_text,
        null: false

      t.references :ad,
        index: true,
        foreign_key: true

      t.timestamps null: false
    end
  end
end
