<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>$Subject</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
	<div>
		<p>Hi <% if $Member.FirstName %>{$Member.FirstName}<% else %>there<% end_if %>,</p>
		<p>Nice, Thank you for registering!</p>
	</div>

	<div>
		<p>Thanks for registering online with Love Your Water, you're nearly done! <br />Please <a href="$VerificationLink">verify your account </a> to complete your online account registration.</p>

		<p style="margin-bottom:15px;">Thanks,<br />The Love Your Water Team</p>
	</div>
</body>