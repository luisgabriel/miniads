class CreateTargetings < ActiveRecord::Migration
  def change
    create_table :targetings do |t|
      t.text :places

      t.integer :gender,
        null: false

      t.references :ad,
        index: true,
        foreign_key: true,
        null: false

      t.timestamps null: false
    end
  end
end
