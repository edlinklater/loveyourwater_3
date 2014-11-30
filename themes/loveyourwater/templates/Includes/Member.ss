<% if $CurrentMember %>
	<li><a href="{$BaseURL}Security/logout"><span class="glyphicon glyphicon-sign-out" aria-hidden="true"></span> Log out</a></li>
	<li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> $CurrentMember.FirstName $CurrentMember.Surname</a></li>
<% else %>
	<% if RegistrationLink %><li><a href="$RegistrationLink">Sign Up</a></li><% end_if %>
  	<li class="divider-vertical"></li>
	<li class="dropdown">
		<a class="dropdown-toggle" href="#" data-toggle="dropdown">Log In <strong class="caret"></strong></a>
		<div class="dropdown-menu" style="padding: 15px; padding-bottom: 0px;">
			$LoginForm
			<%-- <form method="post" action="login" accept-charset="UTF-8">
				<input style="margin-bottom: 15px;" type="text" placeholder="Username" id="username" name="username">
				<input style="margin-bottom: 15px;" type="password" placeholder="Password" id="password" name="password">
				<input style="float: left; margin-right: 10px;" type="checkbox" name="remember-me" id="remember-me" value="1">
				<label class="string optional" for="user_remember_me"> Remember me</label>
				<input class="btn btn-primary btn-block" type="submit" id="sign-in" value="Sign In">
				<label style="text-align:center;margin-top:5px">or</label>
                <input class="btn btn-primary btn-block" type="button" id="sign-in-google" value="Sign In with Google">
				<input class="btn btn-primary btn-block" type="button" id="sign-in-twitter" value="Sign In with Twitter">
			</form> --%>
		</div>
	</li>
<% end_if %>