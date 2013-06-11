class Company < ActiveRecord::Base
  attr_accessible :name

  resourcify #for use with contact.add_role :client, current_user.company

  has_many :users
  has_many :contacts, :through => :users
end
