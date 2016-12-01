<?php

$f3=require('lib/base.php');

$f3->set('DEBUG',1);
if ((float)PCRE_VERSION<7.9)
	trigger_error('PCRE version is out of date');

$f3->config('config.ini');
$f3->route('GET /',
	function($f3) {
		$classes=array(
			'DB\SQL'=>
				array(
					'pdo',
					'pdo_mysql'
				)
		);
		$f3->set('classes',$classes);

		$line_tmpl = array('item_id' =>'460000000027017',
			'project_id' =>'',
			'expense_id' =>'',
			'name' =>'Print Services',
			'description' =>'500GB, USB 2.0 interface 1400 rpm, protective hard case.',//from db
			'item_order' =>1,
			'rate' =>120.00,//from db
			'unit' =>'Nos',
			'quantity' =>1.00,
			'discount' =>0.00,
			'tax_id' =>'460000000027005'
		);
		$out_tmpl  = array('customer_id' => '', 'date' => '', 'line_items' => array(), 'notes' => 'Thanks for your business.');
/*
- assume the following:
-- the following JSON fields come from the sample data in the database: customer_id, description, rate *No customer_id
-- the following JSON fields have constant values as set in the sample JSON: item_id, name, unit, tax_id, notes, quantity
-- "item_order" field in JSON is an incremented number per json *How many I should produce?
-- other JSON fields can be blank or set as the sample JSON indicates.
-- the device_serial_number field in the lines_to_invoice table is used as a key but is not required in the JSON. *Key from where? What to map?
*/
		$db=new \DB\SQL('mysql:host='.$f3->get('dbhost').';port='.$f3->get('dbport').';dbname='.$f3->get('dbname'), $f3->get('dbuser'), $f3->get('dbpass'));
		$customs=$db->exec('SELECT * FROM customer_to_invoice ORDER BY zoho_books_contact_id DESC');

		$out = array();
		foreach($customs as $custom){
			$c = $out_tmpl;
			$c['customer_id'] =  $custom['zoho_books_contact_id'];
			$recs=$db->exec('SELECT description, rate FROM lines_to_invoice WHERE zoho_books_contact_id = "'.$c['customer_id'].'"');

			for($i=0; $i<count($recs);$i++){
				$r = $line_tmpl;
				$r['description'] = $recs[$i]['description'];
				$r['rate'] = $recs[$i]['rate'];
				$r['item_order'] = $i+1;
				array_push($c['line_items'],  $r);
			}
			array_push($out,  $c);
		}
		echo json_encode($out);
	}
);



$f3->run();