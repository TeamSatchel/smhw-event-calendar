class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.text :description, null: false, default: ''
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.timestamps
    end
  end
end
