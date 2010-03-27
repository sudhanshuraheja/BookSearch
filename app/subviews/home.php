<div class='span-24'>
	<div class='span-20'>
		<div class='home-bookname'>
			<form id='search' name='search' method='get' action='<?php echo href('/search') ?>' onsubmit='setRedirect(); return false;'>
			Please enter the name of the book or ISBN here
			<input type='text' name='book' value="<?php echo htmlspecialchars(stripslashes($this->get('search_term'))); ?>" class='home-big-input' id='home-bookname-input' />
		</div>
	</div>
	<div class='span-4 last'>
		<div class='home-booksearch'>
			<br />
			<input type='submit' name='action' value='Search' class='home-big-submit' id='home-search-submit' />
			</form>
		</div>
	</div>
</div>
