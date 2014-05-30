class CreateMoments < ActiveRecord::Migration
  def change
    create_table :moments do |t|
      t.integer :lapse_id
      t.timestamps
    end
  end
end
