class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :title
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :suffix
      t.string :company
      t.string :department
      t.string :job_title
      t.string :business_street
      t.string :business_street_2
      t.string :business_street_3
      t.string :business_city
      t.string :business_state
      t.string :business_postal_code
      t.string :business_country_region
      t.string :home_street
      t.string :home_street_2
      t.string :home_street_3
      t.string :home_city
      t.string :home_state
      t.string :home_postal_code
      t.string :home_country_region
      t.string :other_street
      t.string :other_street_2
      t.string :other_street_3
      t.string :other_city
      t.string :other_state
      t.string :other_postal_code
      t.string :other_country_region
      t.string :assistant_phone
      t.string :business_fax
      t.string :business_phone
      t.string :business_phone_2
      t.string :home_fax
      t.string :home_phone
      t.string :home_phone_2
      t.string :mobile_phone
      t.string :other_fax
      t.string :other_phone
      t.string :primary_phone
      t.date :anniversary
      t.string :assistant_name
      t.string :billing_information
      t.date :birthday
      t.string :business_address_po_box
      t.string :categories
      t.string :children
      t.string :email
      t.string :email_display_name
      t.string :email_2
      t.string :email_2_display_name
      t.string :email_3
      t.string :email_3_display_name
      t.text :notes
      t.string :spouse
      t.string :webpage
      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
