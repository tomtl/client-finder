class AddLatLonFields < ActiveRecord::Migration
  def change
    change_table :clients do |t|
      t.float :latitude
      t.float :longitude
    end
  end
end
