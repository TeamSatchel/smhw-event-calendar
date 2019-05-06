class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :description
      t.string :title
      t.datetime :end_date
      t.datetime :start_date

      t.timestamps
    end
  end
end
