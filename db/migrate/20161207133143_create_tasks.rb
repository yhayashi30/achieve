class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.string :title
      t.text :content
      t.datetime :deadline
      t.integer :charge_id, null: false
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
