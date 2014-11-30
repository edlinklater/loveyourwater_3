<div class="jumbotron jumbotron--brand">
	<div class="container">
		<h1>$Title</h1>
		<p>$Content</p>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-sm-6">
			<% if $CurrentMember %>
			$CreateEvent
			<% else %>
				You must be logged in to create an event
			<% end_if %>
		</div>
	</div>
</div>