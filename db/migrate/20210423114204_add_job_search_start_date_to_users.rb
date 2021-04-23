class AddJobSearchStartDateToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :job_search_start_date, :string
  end
end
