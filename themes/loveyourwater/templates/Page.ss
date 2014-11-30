<!DOCTYPE html>
<html lang="en">
<head>
    <% base_tag %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>$SiteConfig.Title – <% if URLSegment != home %>$Title<% else %>$SiteConfig.Tagline<% end_if %></title>

	<% base_tag %>

    <!-- Bootstrap -->
    <link href="$ThemeDir/css/bootstrap.min.css" rel="stylesheet">
    <link href="$ThemeDir/css/carousel.css" rel="stylesheet">
    <link href="$ThemeDir/css/brand.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>

    <!-- NAVBAR
        ================================================== -->
        <div class="navbar-wrapper">
            <div class="container">

                <nav class="navbar navbar-default navbar-static-top" role="navigation">
                    <% include Nav %>
                </nav>

            </div>
        </div>

        <%-- <div class="container"> --%>
            $Layout
        <%-- </div> --%>

        <!-- FOOTER -->
        <footer class="footer">
            <% include Footer %>
        </footer>

    </div><!-- /.container -->

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="$ThemeDir/js/bootstrap.min.js"></script>
</body>
</html>