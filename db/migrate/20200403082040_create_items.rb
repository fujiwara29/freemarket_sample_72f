class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name,            null: false
      t.references :image_id,        null: false
      t.text       :introduction,    null: false
      t.references :category_id,     null: false
      t.references :brand_id
      t.string     :condition,       null: false
      t.string     :postage_payer,   null: false
      t.integer    :prefecture_code, null: false
      t.references :preparation_day, null: false
      t.integer    :price,           null: false
      t.string     :trading,         null: false
      t.timestamps
    end
  end
end