<% loop Events %>
<div class="col-sm-6">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title"><span class="event-title">$Title</span> <span class="pull-right event-date"><% if $StartDateTime %>$StartDateTime.Nice<% else %><% if $AllDay %>All Day<% else %>$FormattedTimeframe<% end_if %><% end_if %></span></h3>
        </div>
        <div class="panel-body">
            <div class="media">
                <a class="media-left event-image" href="#">
                    <img data-src="holder.js/64x64" alt="64x64" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIHZpZXdCb3g9IjAgMCA2NCA2NCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+PGRlZnMvPjxyZWN0IHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjEzLjQ2MDkzNzUiIHk9IjMyIiBzdHlsZT0iZmlsbDojQUFBQUFBO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1mYW1pbHk6QXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7Zm9udC1zaXplOjEwcHQ7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+NjR4NjQ8L3RleHQ+PC9nPjwvc3ZnPg==" data-holder-rendered="true" style="width: 64px; height: 64px;">
                </a>
                <div class="media-body">
                    <p><strong><span class="event-location">$Region</span><% if $AllDay %> @ <span class="event-time"> all day</span><% else_if StartDateTime %> @ <span class="event-time">$StartDateTime.Format(g:i)</span><% end_if %></strong></p>
                    <p class="event-description">$Details.Summary</p>
                    <a href="$Top.getEventLink($ID)" class="btn btn-info btn-block"><span class="glyphicon glyphicon-plus"></span> Join this event!</a>
                </div>
            </div>
        </div>
    </div>
</div>
<% if $Pos = 2 %>
<div class="clearfix"></div>
<% end_if %>
<% end_loop %>
