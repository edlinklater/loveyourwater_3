<div class="jumbotron jumbotron--brand">
	<div class="container">
		<h1>$Title</h1>
		<% if Summary %><p>$Summary</p><% end_if %>
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="col-lg-12">
			$Content
		</div>
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="col-lg-8 document-panel">
			<h3>Useful documents</h3>

			<div class="row">
			<% loop $Documents %>

				<div class="col-lg-6 document-item">

					<div class="row">

						<div class="col-lg-12 text-center">
							<!-- Preview -->
							<img src="$File.Filename" width="100%">
							<div class="heading-row clearfix">

								<div class="col-lg-3 text-center col-icon">

									<!-- File type -->
									<img src="$File.Icon">

								</div>

								<div class="col-lg-9 col-title">

									<!-- Title -->
									<h4><a href="$File.Link">$Title</a></h4>

								</div>

							</div>

							<div class="description-row">

								<div class="col-lg-12">

									$Description

								</div>

							</div>
						</div>
					</div>


				</div>

			<% end_loop %>
			</div>
			
		</div>
		<div class="col-lg-4 document-panel">
			<h3>Useful videos</h3>
		</div>
	</div>
</div>

