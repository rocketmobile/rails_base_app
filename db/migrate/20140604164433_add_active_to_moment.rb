class AddActiveToMoment < ActiveRecord::Migration
  def change
    add_column :moments, :active, :boolean, default: true
  end
end
