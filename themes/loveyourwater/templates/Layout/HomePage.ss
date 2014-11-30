<!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
       <% include Carousel %>
    </div><!-- /.carousel -->

    <div class="container">
        <% if $Events %>
            <h2 class="page-header">Upcoming events</h2>
            <div class="row">
                <% include EventSummary %>
                <div class="col-sm-4 col-sm-offset-4">
                    <br>
                    <a href="$getEventsLink" class="btn btn-primary btn-lg btn-block">See all events <span class="glyphicon glyphicon-chevron-right"></span></a>
                </div>
            </div>
        <% end_if %>

        <!-- Three columns of text below the carousel -->
        <% if $ActionLinks %>
            <h2 class="page-header">Take action</h2>
            <div class="row">
                <% include ActionLinks %>
            </div><!-- /.row -->
        <% end_if %>
    </div>