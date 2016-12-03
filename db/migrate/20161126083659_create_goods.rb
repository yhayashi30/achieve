class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.integer :blog_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
