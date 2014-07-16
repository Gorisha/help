class AddVideoToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :video, :string
  end
end
