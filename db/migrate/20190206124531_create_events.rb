class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.date :begins
      t.date :ends
      t.text :description
      t.string :title

      t.timestamps
    end
  end
end
