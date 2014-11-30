<ul class="CalendarPageMenu nav nav-pills">
	<li class="calendarview <% if $CurrentMenu == 'calendarview'%>active<% end_if %>">
		<a href="{$CalendarViewLink}">Calendar View</a>
	</li>
	<li class="eventlist <% if $CurrentMenu == 'eventlist'%>active<% end_if %>">
		<a href="{$EventListLink}">List View</a>
	</li>
	<% if $RegistrationsEnabled %>
		<li class="registerableevents <% if $CurrentMenu == 'eventregistration'%>active<% end_if %>">
			<a href="{$Link}eventregistration/">Event Registration</a>
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