<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Arkan Denys">

    <title>Edit rss</title>

    
<?php 
foreach($css_files as $file): ?>
	<link type="text/css" rel="stylesheet" href="<?php echo $file; ?>" />
<?php endforeach; ?>
<?php foreach($js_files as $file): ?>
	<script src="<?php echo $file; ?>"></script>
<?php endforeach; ?>

</head>
<body>

<div class="container"  style="padding-top:50px;">
	<div class="row">
		<div class="col-lg-12">
			

<h1><?=anchor("","RSS Reader");?></h1>
<br>
    <h2>Edit rssfeed</h2>
<p>Edit your feed sources</p>
		<?php echo $output; ?>

                
                </div>
	</div>
</div>