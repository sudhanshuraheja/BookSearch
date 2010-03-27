<?php

	// Example
	//   URL = /this-is-my-tag/generatrix-can-now-reorder-urls/comments
	//	 Here we need to go to blogController and call the function comments
	//	 URL2 = /admin/comments/all
	//	 Here we need to go to admincommentsController and call the function all
	//
	// PLEASE SET $output['controller'] and $output['method']

	function mapping($request) {
		$output = array();

		$output['controller'] = $request[0];
		$output['method'] = $request[1];

		return $output;
	}

?>
