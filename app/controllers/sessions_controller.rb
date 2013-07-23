class SessionsController < ApplicationController
  require 'google/api_client'

  def create
    #What data comes back from OmniAuth?
    @auth = request.env["omniauth.auth"]
    #Use the token from the data to request a list of calendars
    @token = @auth["credentials"]["token"]
    client = Google::APIClient.new
    client.authorization.access_token = @token
    service = client.discovered_api('calendar', 'v3')
    @result = client.execute(
#      :api_method => service.activities.list,
#      :parameters => {'collection' => 'public'},
#      :api_method => service.calendar_list.list,
#      :parameters => {},
      :api_method => service.events.list,
        :parameters => {'calendarId' => 'primary', 'timeMin' => Date.today.beginning_of_day.xmlschema, 'timeMax' => Date.today.end_of_day.xmlschema},
#      :api_method => service.events.quick_add,
#        :parameters => {'calendarId' => 'primary', 'text' => 'Appointment at Somewhere on July 17th 10am-10:25am'},
        :headers => {'Content-Type' => 'application/json'})
  end
end
