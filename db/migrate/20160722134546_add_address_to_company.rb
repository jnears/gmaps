class AddAddressToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :address, :text
    add_column :companies, :city, :string
    add_column :companies, :postcode, :string
  end
end
