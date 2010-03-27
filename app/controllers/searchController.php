<?php

	/*
		You can do the following in the controller

		1. TO DISPLAY ERRORS :
				display_error("Calls to the function <strong>display_error($message)</strong> are displayed like this");
				display_warning("Calls to the function <strong>display_warning($message)</strong> are displayed like this");
				display_system("Calls to the function <strong>display_system($message)</strong> are displayed like this");
				display("Calls to the function <strong>display($message)</strong> are displayed like this");

		2. TO HANDLE DATABASES :
				If you have the following table
				CREATE TABLE IF NOT EXISTS `students` (
					`id` int(11) NOT NULL auto_increment,
					`name` varchar(64) NOT NULL,
					`phone` varchar(64) NOT NULL,
					`status` varchar(128) NOT NULL,
				PRIMARY KEY  (`id`)
				) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

				Then run php index.php generatrix preparedb

				This would create a class students and you can run
				$students = new students($this->getDb());
				$students_data = $students->select("*", "WHERE id=5");
				$students_data = $students->delete("WHERE id=5");
				$students_data = $students->update(array("name" => "sudhanshu"), "WHERE id=5");
				$students_data = $students->insert(array("name" => "sudhanshu", "phone" => "1234567890", "status" => "working on generatrix"));

		3. TO PASS VALUES TO THE VIEW :
				$this->set("sample", "This is sample content which was set in the controller");
				$this->set("students_data", $students_data);
	*/

	class searchController extends Controller {

		public function base() {
			$this->savePageView();
			$this->set('search_term', '');
		}

		public function book() {
			$url = $this->getURL();
			$search_term = isset($url[2]) ? $url[2] : '';
			if($search_term) {
				$this->parseFlipkartSearch($search_term);
			}
			$this->set('search_term', $search_term);
		}

		private function savePageView() {
			$traffic = new traffic($this->getDb());

			$request_url = isset($_SERVER['REQUEST_URI']) ? $_SERVER['REQUEST_URI'] : '';
			$remote_addr = isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : '';
			$referer = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : '';
			$user_agent = isset($_SERVER['HTTP_USER_AGENT']) ? $_SERVER['HTTP_USER_AGENT'] : '';

			$traffic->insert(array(
				'page' => $request_url,
				'timestamp' => time(),
				'ip' => $remote_addr,
				'referer' => $referer,
				'useragent' => $user_agent
			));
		}

		// FLIPKART
		private function parseFlipkartSearch($search_term) {
			$url = 'http://www.flipkart.com/search.php?query=' . urlencode($search_term);

			$parser = new DomParser();
			$parser->load($url);

			$divs = $parser->elements($parser->getDom(), 'div');
			foreach($divs as $div) {
				if($parser->matchAttribute($div, 'class', 'search_result_item')) {

					$result = array();

					$idivs = $parser->elements($div, 'div');
					foreach($idivs as $idiv) {
						if($parser->matchAttribute($idiv, 'class', 'search_result_image')) {
							$images = $parser->elements($idiv, 'img');
							foreach($images as $image) {
								//display('Image Link : ' . $parser->src($image));
								$result['image'] = $parser->src($image);
								// Do something about images which don't exist
							}
						} else if($parser->matchAttribute($idiv, 'class', 'search_result_title')) {
							$count = 0;
							$links = $parser->elements($idiv, 'a');
							foreach($links as $link) {
								if($count == 0) {
									//display('Book link : http://flipkart.com' . $parser->href($link));
									$result['link'] = 'http://flipkart.com' . $parser->href($link);
									//display('Book Title : ' . $parser->text($link));
									$result['title'] = $parser->text($link);
								} else {
									//display('Author Link : http://flipkart.com' . $parser->href($link));
									$result['authorlink'] = 'http://flipkart.com' . $parser->href($link);
									//display('Author Name : ' . $parser->text($link));
									$result['author'] = $parser->text($link);
								}
								$count++;
							}
						} else if($parser->matchAttribute($idiv, 'class', 'search_result_item_info')) {
							$spans = $parser->elements($idiv, 'span');
							foreach($spans as $span) {
								if($parser->matchAttribute($span, 'class', 'search_results_price')) {
									$fonts = $parser->elements($span, 'font');
									foreach($fonts as $font) {
										//display('Book price is ' . $parser->text($font));
										$result['price'] = $parser->text($font);
									}
								}
							}
							$tables = $parser->elements($idiv, 'table');
							foreach($tables as $table) {
								if($parser->matchAttribute($table, 'class', 'search_result_item_shipping')) {
									$bolds = $parser->elements($table, 'b');
									foreach($bolds as $bold) {
										$data = trim( strtolower( $parser->text($bold) ) );
										if($data == 'shipping free.') {
											//display('Shipping : Shipping free');
											$result['freeshipping'] = true;
										} else if(strpos($data, 'days') !== false) {
											$data = trim( str_replace('business days', '', $data) );
											//display('Delivery in : ' . $data);
											$result['delivery'] = $data;
										} else if($data == 'out of stock') {
											//display('Out of stock : YES');
											$result['available'] = false;
										} else if($data == 'email address:') {
										} else {
											display_error('Found ' . $data);
										}
									}
									$italics = $parser->elements($table, 'i');
									foreach($italics as $italic) {
										$data = trim( strtolower( $parser->text($italic) ) );
										if($data == 'available.') {
											//display('Available (Available): YES');
											$result['available'] = true;
										} else if($data == 'in stock.') {
											//display('Available (In stock) : YES');
											$result['available'] = true;
										} else if($data == 'imported edition.') {
											$result['available'] = true;
											$result['imported'] = true;
										} else {
											display_error('Found ' . $data);
										}
									}
								}
							}
						}
					}
					display($result);
				}
			}
		}

	}

?>
