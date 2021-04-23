class AddWeekRefToActivities < ActiveRecord::Migration[6.1]
  def change
    add_reference :activities, :week, null: false, foreign_key: true
  end
end
