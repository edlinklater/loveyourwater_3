
<div class="jumbotron jumbotron--brand">
	<div class="container">
		<h1>$title</h1>
		<p>$Content.Summary</p>
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-9">
			<% if $CurrentMember %>
			$CreateEvent
			<% else %>
				You must be logged in to create an event
			<% end_if %>
		</div>
	</div>
</div>
