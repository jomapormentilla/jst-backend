class AddUserRefToWeeks < ActiveRecord::Migration[6.1]
  def change
    add_reference :weeks, :user, null: false, foreign_key: true
  end
end
