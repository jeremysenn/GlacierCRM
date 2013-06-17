class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  belongs_to :company
  has_many :contacts

  def clients
    contacts.tagged_with("Client")
  end

  def client_birthdays_this_week
    clients.find_birthdays_for(Date.today, Date.today.advance(:weeks => 1))
  end

  def client_birthdays_this_month
    clients.find_birthdays_for(Date.today, Date.today.advance(:months => 1))
  end

  def client_anniversaries_this_week
    clients.find_anniversaries_for(Date.today, Date.today.advance(:weeks => 1))
  end

  def client_anniversaries_this_month
    clients.find_anniversaries_for(Date.today, Date.today.advance(:months => 1))
  end

  ##############################
  #    Class Methods           #
  ##############################

  def send_birthday_and_anniversaries_this_week_email
    UserMailer.weekly_birthday_and_anniversary_report(self).deliver
  end

  def send_birthday_and_anniversaries_this_month_email
    UserMailer.monthly_birthday_and_anniversary_report(self).deliver
  end
  
end
