<?php


$app->get('/', function()
{
	dd('Hello, Mobile Camera based Calculator for Android Devices');
});

$app->post('/simple', function(){

	$image = Input::get('image');
	$binary = base64_decode($image);
	$saveImage = fopen(public_path('matlab/simple.png'), 'w');
	fwrite( $saveImage, $binary );
	fclose( $saveImage );

	$base = public_path('matlab');
	$script = "/usr/local/MATLAB/R2014a/bin/matlab -nodisplay -nosplash -nodesktop -r 'run " . $base . "/simple;exit;'";

	// Matlab sends ASCII code to Output buffer. Which should be refactored,
	// instead we will fetch the answer from the txt file.
	ob_start();
	passthru($script, $result);
	$var = ob_get_contents();
	ob_end_clean();
	
	$file = File::get(public_path('matlab/simple.txt'));
	$data = explode("_", $file);
	Log::info($data);

	return Response::json(array('question' => $data[0], 'answer' => $data[1]));

});

$app->post('/quadratic', function(){

	$image = Input::get('image');
	$binary = base64_decode($image);
	$saveImage = fopen(public_path('matlab/quadratic.png'), 'w');
	fwrite( $saveImage, $binary );
	fclose( $saveImage );

	$base = public_path('matlab');
	$script = "/usr/local/MATLAB/R2014a/bin/matlab -nodisplay -nosplash -nodesktop -r 'run " . $base . "/quadratic;exit;'";

	// Matlab sends ASCII code to Output buffer. Which should be refactored,
	// instead we will fetch the answer from the txt file.
	ob_start();
	passthru($script, $result);
	$var = ob_get_contents();
	ob_end_clean();

	
	$file = File::get(public_path('matlab/quadratic.txt'));
	$fileques = File::get(public_path('matlab/quadeq.txt'));

	return Response::json(array('question' => $fileques, 'answer' => $file));

});