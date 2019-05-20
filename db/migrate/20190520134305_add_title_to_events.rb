class AddTitleToEvents < ActiveRecord::Migration[5.2]
  def change

    change_table :events do |t|
      t.string :title, null: false
    end

  end
end
