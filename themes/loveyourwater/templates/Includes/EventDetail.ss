<% include CalendarPageMenu %>
<div class="EventDetail">
	<% with Event %>
		<div class="eventFullDetails">
			<div class="feedBox">
				<% if $Calendar %>
					<% with $Calendar %>
						<a href="{$Top.Link}calendar/$Link/" class="feed-checkbox" original-title="Subscribe to this Calendar on your Home computer or Mobile Phone" style="background-color:$ColorWithHash;"></a>
					<% end_with %>
				<% end_if %>
			</div>
			<div class="fatDate">
				<span class="dayOfMonth">$StartDateTime.DayOfMonth</span>
				<span class="month">$StartDateTime.Format('F, Y')</span>
			</div>
			<div class="content">
				<h4>$Title</h4>
				<div class="datesAndTimeframe">
					<% if $StartAndEndDates %>
						<span>$StartAndEndDates</span>
					<% else %>
						<% if $AllDay %>
							<span>All Day</span>
						<% else %>
							<span>$FormattedTimeframe</span>
						<% end_if %>
					<% end_if %>
				</div>
				<% if $EventPage %>
					<% with $EventPage %>
						<a href="$Link" style="margin: 12px 0 0 19px;display: block;">Go to the $Title page</a>
					<% end_with %>
				<% end_if %>
			</div>
		</div>
		$Details
		<% if $Location %>
			<div id="eventLocationMap" data-geometry="$Location" style="height: 400px"></div>
			<% require css('http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.css') %>
			<% require javascript('http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.js') %>
			<% require javascript('themes/loveyourwater/js/event-detail.js') %>
		<% end_if %>
	<% end_with %>
</div>