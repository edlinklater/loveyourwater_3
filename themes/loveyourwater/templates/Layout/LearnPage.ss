<div class="jumbotron jumbotron--brand">
	<div class="container">
		<h1>$Title</h1>
		<% if Summary %><p>$Summary</p><% end_if %>
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="col-lg-4">
			$Content
		</div>
		<div class="col-lg-8">
			Presentation banner
		</div>
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="col-lg-8">
			<h3>Useful documents <span class="pull-right"><a href="#">Filter</a> <a href="#">All</a></h3>

			<% loop $Documents %>

				<% with $File %>
					$Filename
				<% end_with %>

			<% end_loop %>
			
		</div>
		<div class="col-lg-4">
			<h3>Useful videos</h3>
		</div>
	</div>
</div>


