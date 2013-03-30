<html>
	<head>
		
 
		<script type="text/javascript" src="${request.static_url('poe:static/js/jquery.js')}"></script>
		<link rel="stylesheet" href="${request.static_url('poe:static/css/styles.css')}" type="text/css" media="screen" charset="utf-8" />

		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
  		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
 		<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

		<script>
			  $(function() {
				  $("tr:not(.accordion)").hide();
				  $("tr:first-child").show();
				  $("tr.accordion").click(function(){
				  	$(this).nextUntil(".accordion", "tr").toggle();
				  	if($(this).css('background-color')=="rgb(221, 221, 221)"){
				  		$(this).css('background-color', '#FFFF99');
				  	}
				  	else{
				  		$(this).css('background-color', '#FFFFFF');
				  	}
				    });
				  });
					  </script>
	</head>
	<body>
		<div id="wrapper">
			<div id="search">
				<form action="results" method="GET"><input class="searchbox" type="text" name="query" type="query" /><input style="padding: 5px;" type="submit" name="submit" value="Search" /></form>
				<h3>You searched for "${query}"</h3>
			</div>
			<div id="prefixes" style="float: left;">
				<h4>Prefixes</h4>
				<table>
					<tr>
						<th>Level</th>
						<th>Description</th>
						<th>Value</th>
						<th>Name</th>
					</tr>

					% for item in results:
						% if item[4] == 'Suffix':
							<% break %>
						% endif
						<tr class="${'nest' if (results[results.index(item)-1][0] == item[0]) else 'accordion'}" >
								<td>${item[3]}</td>
								<td>${item[0]}</td>
								<td>${item[1]}</td>
								<td>${item[2]}</td>
						</tr>
					% endfor
				</table>
			</div>

			<div id="suffixes">
				<h4>Suffixes</h4>
				<table>
					<tr>
						<th>Level</th>
						<th>Description</th>
						<th>Value</th>
						<th>Name</th>
					</tr>

					% for item in results:
						% if item[4] == 'Suffix':
							<tr class="${'nest' if (results[results.index(item)-1][0] == item[0]) else 'accordion'}" >
								<td>${item[3]}</td>
								<td>${item[0]}</td>
								<td>${item[1]}</td>
								<td>${item[2]}</td>
							</tr>
						% endif
					% endfor
				</table>
			</div>
			<div id="implicit">
				<h4>Implicit</h4>
				<table>
					<tr>
						<th>Level</th>
						<th>Description</th>
						<th>Value</th>
						<th>Name</th>
					</tr>

					% for item in results:
						% if item[4] == 'Implicit':
							<tr class="${'nest' if (results[results.index(item)-1][0] == item[0]) else 'accordion'}">
								<td>${item[3]}</td>
								<td>${item[0]}</td>
								<td>${item[1]}</td>
								<td>${item[2]}</td>
							</tr>
						% endif
					% endfor
				</table>
			</div>
		</div>
	</body>
</html>