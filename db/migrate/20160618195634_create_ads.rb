class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.decimal :budget,
        precision: 12,
        scale: 2,
        null: false

      t.timestamps null: false
    end
  end
end
