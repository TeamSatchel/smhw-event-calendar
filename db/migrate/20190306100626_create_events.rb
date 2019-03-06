class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime  :event_start
      t.datetime  :event_end
      t.text      :description
      t.timestamps null: false
    end
  end
end
