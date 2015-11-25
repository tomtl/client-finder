class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name, :last_name, :title, :company, :address, :city,
               :state, :zip, :phone_office, :phone_mobile, :email
      t.timestamps
    end
  end
end
