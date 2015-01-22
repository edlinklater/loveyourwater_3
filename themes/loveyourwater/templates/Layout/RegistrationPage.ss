<div class="jumbotron jumbotron--brand">
	<div class="container">
		<h1>$Title</h1>
		<p>$Content</p>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-sm-6">
			<% if $isSuccess %>
				<div class="content">$SuccessMessage</div>
				<p>The link will expire in {$ExpiryHours} hours.</p>
			<% else_if $isConfirmed %>
				<div class="content">$ConfirmedMessage</div>
			<% else_if $isVerified %>
				<div class="content">$VerifiedMessage</div>
			<% else %>
				<div class="content">$Content</div>
				$Form
				$PageComments
			<% end_if %>
		</div>
	</div>
</div>