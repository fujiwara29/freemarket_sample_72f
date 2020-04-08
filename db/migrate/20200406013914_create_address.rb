class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer    :post_code,		    null: false, limit: 4
      t.integer	   :prefecture_code,	null: false, limit: 4
      t.string     :city,		          null: false
      t.string     :house_number,		  null: false
      t.string     :building_name	 
      t.references :user,             null: false

      t.timestamps
    end
  end
end
