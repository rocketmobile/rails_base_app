class CreateLapses < ActiveRecord::Migration
  def change
    create_table :lapses do |t|
      t.string :name
      t.timestamps
    end
  end
end
