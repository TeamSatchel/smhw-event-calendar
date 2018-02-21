class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :description, null: false
      t.date :start_date, null: false
      t.date :end_date

      t.timestamps null: false
    end
  end
end
