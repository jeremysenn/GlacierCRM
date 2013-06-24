class UserMailer < ActionMailer::Base
#  default from: "info@glacierwealth.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.birthday_and_anniversary_report.subject
  #
  def weekly_birthday_and_anniversary_report(user)
    @user = user
    @birthday_clients = @user.client_birthdays_this_week
    @anniversary_clients = @user.client_anniversaries_this_week

    mail to: user.email,
      cc:    "jeremy@glacierwealth.com",
      from:  "jeremy@glacierwealth.com",
    subject: "Weekly Birthday and Anniversary Report"
  end

  def monthly_birthday_and_anniversary_report(user)
    @user = user
    @birthday_clients = @user.client_birthdays_this_month
    @anniversary_clients = @user.client_anniversaries_this_month

    mail to: user.email,
        cc:  "jeremy@glacierwealth.com",
      from:  "jeremy@glacierwealth.com",
    subject: "Monthly Birthday and Anniversary Report"
  end

  def yearly_birthday_and_anniversary_report(user)
    @user = user
    @birthday_clients = @user.client_birthdays_this_year
    @anniversary_clients = @user.client_anniversaries_this_year

#    mail to: user.email,
    mail to: "senn.jeremy@gmail.com",
#        cc:  "jeremy@glacierwealth.com",
      from:  "jeremy@glacierwealth.com",
    subject: "Yearly Birthday and Anniversary Report"
  end
end
