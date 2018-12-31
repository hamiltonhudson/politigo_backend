class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :cause
      t.string :style
      t.string :location
      t.date :date
      t.string :time

      t.timestamps
    end
  end
end
