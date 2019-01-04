class AddLatLongToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :lat, :string
    add_column :events, :long, :string
  end
end
