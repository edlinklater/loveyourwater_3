<% include SideBar %>
<div class="content-container unit size3of4 lastUnit">
	<article>
		<h1>$Title</h1>
	</article>

	<% if $isSuccess %>
		<div class="content">$SuccessMessage</div>
	<% else %>
		<div class="content">$Content</div>
		$Form
		$PageComments
	<% end_if %>
</div>