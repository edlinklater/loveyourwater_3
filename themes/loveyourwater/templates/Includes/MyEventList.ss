
<% if $Action == 'eventregistration' %>
	<% include CalendarPageMenu CurrentMenu='eventregistration' %>
<% else %>
	<% include CalendarPageMenu CurrentMenu='eventlist' %>
<% end_if %>

<% include FullcalendarCustomNav CurrentMenu='eventlist' %>

<div class="EventList">

	<% if $getMyEvents %>
		<div class="Events">
			<% include MyEventListEvents %>
		</div>
	<% else %>
		<em class"noEventsMsg">No events in this period</em>
	<% end_if %>

</div>







