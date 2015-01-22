<% loop Events %>
<div class="col-sm-6">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title event-title">$Title</h3>
            <h4 class="panel-title event-date"><% if $StartDateTime %>$StartDateTime.Nice<% else %><% if $AllDay %>All Day<% else %>$FormattedTimeframe<% end_if %><% end_if %></h4>
        </div>
        <div class="panel-body">
            <div class="media">
                <a class="media-left event-image" href="#">
                    <img alt="64x64 default" src="{$ThemeDir}/assets/images/default-upcoming-thumb.jpg" height="64" width="64" />
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
