class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name,            null: false
      t.references :image,           null: false
      t.text       :introduction,    null: false
      t.references :category,        null: false
      t.references :brand
      t.string     :condition,       null: false
      t.string     :postage_payer,   null: false
      t.string     :prefecture_code, null: false
      t.string     :preparation_day, null: false
      t.integer    :price,           null: false
      t.string     :trading,         null: false
      t.timestamps
    end
  end
end