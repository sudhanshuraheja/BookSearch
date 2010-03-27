<?php

  class authors extends Model {
    public function __construct($database) {
      $this->construct($database, "authors", array(
				"id" => "int",
				"name" => "varchar_128",
				"about" => "text",
				"speciality" => "varchar_128"
      ));
    }
  }

  class books extends Model {
    public function __construct($database) {
      $this->construct($database, "books", array(
				"id" => "int",
				"isbn" => "int",
				"title" => "text",
				"price" => "varchar_8",
				"author" => "int",
				"author2" => "int",
				"author3" => "int",
				"about" => "text",
				"isbn13" => "varchar_16",
				"binding" => "varchar_16",
				"publish" => "int",
				"publisher" => "varchar_64",
				"pages" => "int",
				"language" => "varchar_32",
				"image" => "varchar_64"
      ));
    }
  }

  class results extends Model {
    public function __construct($database) {
      $this->construct($database, "results", array(
				"id" => "int",
				"term" => "text",
				"timestamp" => "int",
				"site" => "varchar_256",
				"page" => "varchar_512",
				"rank" => "int",
				"book" => "int",
				"availability" => "varchar_32",
				"deliverytime" => "varchar_32"
      ));
    }
  }

  class searches extends Model {
    public function __construct($database) {
      $this->construct($database, "searches", array(
				"id" => "int",
				"term" => "text",
				"timestamp" => "int",
				"user" => "int",
				"ip" => "varchar_32"
      ));
    }
  }

  class traffic extends Model {
    public function __construct($database) {
      $this->construct($database, "traffic", array(
				"id" => "int",
				"page" => "varchar_128",
				"timestamp" => "int",
				"ip" => "varchar_32",
				"referer" => "varchar_512",
				"useragent" => "varchar_128"
      ));
    }
  }

?>