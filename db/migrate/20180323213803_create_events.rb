class CreateEvents < ActiveRecord::Migration[5.1]
  def up
    create_table :events do |t|
      t.text :description
      t.date :start_date
      t.date :end_date
      t.integer :length_days, default: 1

      t.timestamps null: false
    end
  end

  def down
    drop_table :events
  end
end
