class AddUserToEvents < ActiveRecord::Migration[5.2]
  def change
    change_table :events do |t|
      t.belongs_to :user, null: false, index: true
    end
  end
end
