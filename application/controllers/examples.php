<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Examples extends CI_Controller {

	public function __construct()
	{
		parent::__construct();		

		$this->load->library('grocery_CRUD');
	}

	public function _example_output($output = null)	
	{
		
		$this->load->view('example.php',$output);
		$this->load->view('templates/footer');
		
	}
	

	public function index()
	{
		
		
		$this->_example_output((object)array('output' => '' ,
						     'js_files' => array() ,
						     'css_files' => array()));
	}

	

	

	

	public function film_management_twitter_bootstrap()
	{
		try{
			$crud = new grocery_CRUD();

			$crud->set_theme('twitter-bootstrap');
			$crud->set_table('film');
			$crud->set_relation_n_n('actors', 'film_actor', 'actor', 'film_id', 'actor_id', 'fullname','priority');
			$crud->set_relation_n_n('category', 'film_category', 'category', 'film_id', 'category_id', 'name');
			$crud->unset_columns('special_features','description','actors');

			$crud->fields('title', 'description', 'actors' ,  'category' ,'release_year', 'rental_duration', 'rental_rate', 'length', 'replacement_cost', 'rating', 'special_features');

			$output = $crud->render();
			$this->_example_output($output);

		}catch(Exception $e){
			show_error($e->getMessage().' --- '.$e->getTraceAsString());
		}
	}
	
	
	public function edit_feeds()
	{
		
		
		try{
			$crud = new grocery_CRUD();

			$crud->set_theme('twitter-bootstrap');	
			$crud->set_table('feeds');
			
			//$crud->set_relation_n_n('my', 'user_feeds', 'users', 'feeds_id', 'users_id', 'link','favourite');
			//$crud->set_relation_n_n('user', 'user_feeds', 'users', 'feeds_id', 'users_id', 'username');
			//$crud->unset_columns('my');
			
			//$crud->fields('link', 'description', 'favourite','user' );

			$output = $crud->render();
			$this->_example_output($output);

		}catch(Exception $e){
			show_error($e->getMessage().' --- '.$e->getTraceAsString());
		}
	}

	

}