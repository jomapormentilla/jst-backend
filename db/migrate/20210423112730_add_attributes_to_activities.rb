class AddAttributesToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :activity_type, :string
    add_column :activities, :company, :string
    add_column :activities, :contact, :string
    add_column :activities, :job_title, :string
    add_column :activities, :job_link, :string
    add_column :activities, :contact_method, :string
    add_column :activities, :action, :string
    add_column :activities, :action_complete, :boolean
    add_column :activities, :notes, :string
    add_column :activities, :status, :string
    add_column :activities, :date, :date
  end
end
