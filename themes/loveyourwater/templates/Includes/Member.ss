<% if $CurrentMember %>
	<li><a href="{$BaseURL}Security/logout"><span class="glyphicon glyphicon-sign-out" aria-hidden="true"></span> Log out</a></li>
	<li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> $CurrentMember.FirstName $CurrentMember.Surname</a></li>
<% else %>
	<% if $RegistrationLink %><li><a href="$RegistrationLink">Sign Up</a></li><% end_if %>
  	<li class="divider-vertical"></li>
	<li>
		<a class="dropdown-toggle" href="/Security/login">Log In</a>
	</li>
<% end_if %>
