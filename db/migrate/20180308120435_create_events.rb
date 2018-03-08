class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :desc
      t.datetime :start
      t.datetime :end
      t.boolean :all_day

      t.timestamps
    end
  end
end
