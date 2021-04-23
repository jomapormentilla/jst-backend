class AddAttributesToWeeks < ActiveRecord::Migration[6.1]
  def change
    add_column :weeks, :commits, :integer
    add_column :weeks, :blog_links, :string
  end
end
