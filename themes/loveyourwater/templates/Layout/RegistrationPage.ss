<div class="jumbotron">
	<div class="container">
		<h1>$Title</h1>
		<p>$Content</p>
	</div>
</div>
<div class="container">
	<div class="col-sm-6">
		<% if $isSuccess %>
			<div class="content">$SuccessMessage</div>
		<% else_if $isConfirmed %>
			<div class="content">$ConfirmedMessage</div>
		<% else %>
			<div class="content">$Content</div>
			$Form
			$PageComments
		<% end_if %>
	</div>
</div>