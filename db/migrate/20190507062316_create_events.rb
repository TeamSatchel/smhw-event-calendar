class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.column :start_time, :datetime
      t.column :end_time, :datetime

      t.column :title, :string
      t.column :desctiption, :text
      t.column :teacher_name, :string

      t.timestamps
    end
  end
end
