class CreateEvents < ActiveRecord::Migration[5.2]
  def up
    create_table :events do |t|
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.text :description, null: false, default: ''
    end
  end

  def down
    drop_table :events
  end
end
