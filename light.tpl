	<!DOCTYPE html>
	<html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
			<link rel="icon" href="stat/favicon.png" type="image/png" />
			<link rel="stylesheet" href="/stat/css/bootstrap.min.css">
			<link rel="stylesheet" href="/stat/css/bootstrap-theme.min.css">
			<script src="stat/jquery-2.2.3.min.js" type="text/javascript"></script>
			<script src="stat/bootstrap.min.js" type="text/javascript"></script>
			<script type="text/javascript">
				$(document).ready(function(){
					$("#btn-on").click(function(){
						$("#btn-on").hide()
						$("#btn-off").show()
						$.get("light?number=1", function(data){
							$("#debug").html(data);
						});
					});
				});
			</script>
			<script type="text/javascript">
				$(document).ready(function(){
					$("#btn-off").click(function(){
						$("#btn-off").hide()
						$("#btn-on").show()
						$.get("light?number=0", function(data){
							$("#debug").html(data);
						});
					});
				});
			</script>
			<title>Light Contral</title>
		</head>
		<body>
			<button id="btn-on" type="button" class="btn btn-default">Power ON</button>
			<button id="btn-off" type="button" class="btn btn-success" style="display:none;">Power OFF</button>
			<h1><span id="debug" class="label label-info"></span></h1>
		</body>
	</html>
