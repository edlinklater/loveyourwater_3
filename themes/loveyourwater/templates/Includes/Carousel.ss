<!-- Indicators -->
<ol class="carousel-indicators">
    <% loop Banners %>
        <li data-target="#myCarousel" data-slide-to="$BannerPos($Pos)"<% if First %> class="active"<% end_if %>></li>
    <% end_loop %>
</ol>
<div class="carousel-inner" role="listbox">
    <% loop Banners %>
        <div class="item<% if First %> active<% end_if %>">
            <img src="<% if Image %>$Image.CroppedImage(1280,400).URL<% else %>$ThemeDir/assets/images/hero-beach-01.jpg<% end_if %>" alt="$Image.Title">
            <div class="container">
                <div class="carousel-caption">
                    <% if Title %><h1>$Title</h1><% end_if %>
                    <% if Content %>$Content<% end_if %>
                    <% if ButtonText %>
                        <p><a class="btn btn-lg btn-primary" href="$Link.Link" role="button">$ButtonText</a></p>
                    <% end_if %>
                </div>
            </div>
        </div>
    <% end_loop %>
</div>
<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
</a>
<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
</a>