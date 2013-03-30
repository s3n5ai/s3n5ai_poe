<html>
	<head>
		<link rel="stylesheet" href="${request.static_url('poe:static/css/styles.css')}" type="text/css" media="screen" charset="utf-8" />
	</head>
	<body>
		
		<div id="middle-search">
			<h4>Just type: "66 belt"</h4>
			<form action="results" method="GET">
				<input type="text" id="query" name="query" />
				<input type="submit" id="submit" value="Submit" />
			</form>
		</div>
	</body>
</html>