<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>$Subject</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
	<div>
		<p>Hi <% if $Member.FirstName %>{$Member.FirstName}<% else %>there<% end_if %>,</p>
		<p>Thanks for registering!</p>
	</div>

	<div>
		<p>Success! You have completed your online registration at <a href="$BaseURL">Love Your Water</a>.</p>
		<p style="margin-bottom:15px;">Thanks,<br />The Love Your Water Team</p>
	</div>
</body>