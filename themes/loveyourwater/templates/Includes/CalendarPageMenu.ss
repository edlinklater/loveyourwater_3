<ul class="CalendarPageMenu nav nav-pills">
	<li class="calendarview <% if $CurrentMenu == 'calendarview'%>active<% end_if %>">
		<a href="{$CalendarViewLink}">Calendar View</a>
	</li>
	<li class="eventlist <% if $CurrentMenu == 'eventlist'%>active<% end_if %>">
		<a href="{$EventListLink}">List View</a>
	</li>
	<% if getCalendarFilter %>
		<li role="presentation" class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
			Calendar <span class="caret"></span>
			</a>
			<ul class="dropdown-menu" role="menu">
				<% loop getCalendarFilter %>
					<li><a href="{$Top.Link}filtercalendar/?CalendarFilter=$ID">$Title</a></li>
				<% end_loop %>
			</ul>
		</li>
	<% end_if %>
	<% if $RegistrationsEnabled %>
		<li class="registerableevents <% if $CurrentMenu == 'eventregistration'%>active<% end_if %>">
			<a href="{$Link}eventregistration/">Event Registration</a>
		</li>
	<% end_if %>
	<% if CurrentUser %>
		<li class="myevents <% if $isMyEvents %>active<% end_if %>">
			<a href="{$Link}myevents/">My Events</a>
		</li>
	<% end_if %>
	<% if $SearchEnabled %>
		<li class="search pull-right">
			<form class="form-inline" id="EventSearch" action="{$Link}search">
				<div class="form-group">
					<input class="form-control" type="text" name="q" value="$SearchQuery" />
					<input class="btn btn-default" type="submit" value="search" />
				</div>
			</form>
		</li>
	<% end_if %>
</ul>
