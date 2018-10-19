class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.date :starts_at, null: false
      t.date :ends_at, null: false

      t.timestamps null: false
    end
  end
end
