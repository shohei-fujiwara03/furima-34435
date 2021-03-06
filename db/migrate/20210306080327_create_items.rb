class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title, null: false, default: nil
      t.references :user, null: false, foreign_key: true
      t.integer :category_id, null: false, default: nil
      t.integer :condition_id, null: false, default: nil
      t.integer :price, null: false, default: nil
      t.text :details, null: false, default: nil
      t.integer :shipping_fee_id, null: false, default: nil
      t.integer :prefecture_id, null: false, default: nil
      t.integer :shipping_date_id, null: false, default: nil

      t.timestamps
    end
  end
end
