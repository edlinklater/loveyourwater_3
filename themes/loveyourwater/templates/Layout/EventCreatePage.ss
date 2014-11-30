	<div class="jumbotron jumbotron--brand">
		<div class="container">
			<h1>$title</h1>
			<p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
		</div>
	</div>

	<div class="container">
		<% if $CurrentMember %>
			$CreateEvent
		<% else %>
			You must be logged in to create an event
		<% end_if %>
	</div>