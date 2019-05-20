class EventsMigration < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :start_date
      t.datetime :end_date

      t.text :description

      t.timestamps null: false
    end
  end
end
