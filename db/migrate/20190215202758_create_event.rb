class CreateEvent < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.date   :start_date
      t.date   :end_date
      t.string :color

      t.timestamps
    end
  end
end
