;	<div class="jumbotron jumbotron--brand">
		<div class="container">
			<h1>$title</h1>
			<p>$Content.Summary</p>
		</div>
	</div>

	<div class="container">
		<%-- <div class="row"> --%>
		<% include EventDetail %>

		<% if $Event.Registerable %>
			<% include EventRegistration %>
		<% end_if %>
		<%-- </div> --%>
	</div>