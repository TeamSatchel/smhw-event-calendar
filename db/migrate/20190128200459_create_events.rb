class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :start_at
      t.date :end_at

      t.datetime :created_at
    end
  end
end
