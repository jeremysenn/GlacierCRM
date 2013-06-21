class Contact < ActiveRecord::Base
  attr_accessible :title, :first_name, :middle_name, :last_name, :suffix, :company, :department, :job_title
  attr_accessible :business_street,:business_street_2, :business_street_3, :business_city, :business_state, :business_postal_code
  attr_accessible :business_country_region,:home_street, :home_street_2, :home_street_3, :home_city, :home_state, :home_postal_code
  attr_accessible :home_country_region, :other_street,:other_street_2, :other_street_3, :other_city, :other_state, :other_postal_code
  attr_accessible :other_country_region, :assistant_phone, :business_fax,:business_phone, :business_phone_2, :home_fax, :home_phone
  attr_accessible :home_phone_2, :mobile_phone, :other_fax, :other_phone, :primary_phone,:anniversary, :assistant_name, :billing_information
  attr_accessible :birthday, :business_address_po_box, :categories, :children, :email, :email_display_name, :email_2, :email_2_display_name
  attr_accessible :email_3, :email_3_display_name, :notes, :spouse, :webpage, :tag_list, :document_url

  acts_as_taggable
  acts_as_birthday :birthday
  acts_as_birthday :anniversary
  belongs_to :user

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  ### SUNSPOT SOLR SEARCHING ###
  searchable do
    text :name, :company
  end

  def name
    if !first_name.blank? || !last_name.blank?
      "#{first_name} #{last_name}".strip
    else
      "None"
    end
  end

  def years_as_client
    (anniversary_age.to_i + 1).to_s
  end

  def pretty_home_address
    unless home_street.blank?
      return (home_street + '<br>' + home_city + ', ' + home_state + ' ' + home_postal_code).html_safe
    else
      nil
    end
  end

  def pretty_business_address
    unless business_street.blank?
      return (business_street + '<br>' + business_city + ', ' + business_state + ' ' + business_postal_code).html_safe
    else
      nil
    end
  end

  def pretty_other_address
    unless other_street.blank?
      return (other_street + '<br>' + other_city + ', ' + other_state + ' ' + other_postal_code).html_safe
    else
      nil
    end
  end

  def tagged_with(tag)
    tag_list.include?(tag)
  end

  ### Import CSV File ###
  def self.import(file)
    ### Use this loop instead if not updating records ###
#    CSV.foreach(file.path, headers: true) do |row|
#      Contact.create! row.to_hash
#    end

    ### Use this if updating existing records ###
    CSV.foreach(file.path, headers: true) do |row|
      contact = find_by_id(row["id"]) || new
      contact.attributes = row.to_hash.slice(*accessible_attributes)
      contact.save!
    end
  end

  ### Export to CSV File ###
  def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |contact|
      csv << contact.attributes.values_at(*column_names)
    end
  end
end
end
