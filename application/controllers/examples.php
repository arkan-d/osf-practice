<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Examples extends CI_Controller {

	public function __construct()
	{
		parent::__construct();		

		$this->load->library('grocery_CRUD');
		$this->load->library('ion_auth');
	}

	public function _example_output($output = null)	
	{
		
		$this->load->view('example',$output);
		$this->load->view('templates/footer');
		
	}
	
	

	public function index()
	{
		
		
		$this->_example_output((object)array('output' => '' ,
						     'js_files' => array() ,
						     'css_files' => array()));
		$this->data['title']="Users";	
		if (!$this->ion_auth->logged_in())
		{
			//redirect them to the login page
			redirect('auth/login', 'refresh');
		}
		elseif (!$this->ion_auth->is_admin()) //remove this elseif if you want to enable this for non-admins
		{
			//redirect them to the home page because they must be an administrator to view this
			//return show_error('You must be an administrator to view this page.');
			redirect(base_url());
		}
	}

	

	

	

	//public function edit_feeds_usr()
	//{
	//	try{
	//		$crud = new grocery_CRUD();
	//
	//		$crud->set_theme('twitter-bootstrap');			
	//		$crud->set_model('custom_query_model');
	//		$crud->set_table('feeds'); //Change to your table name
	//		$crud->basic_model->set_query_str("SELECT `feeds`.* FROM (`feeds`) INNER JOIN `user_feeds` ON `user_feeds`.`feeds_id` = `feeds`.`id` WHERE `users_id` = '4'"); //Query text here
	//		$output = $crud->render();
	//		$this->_example_output($output);
	//
	//	}catch(Exception $e){
	//		show_error($e->getMessage().' --- '.$e->getTraceAsString());
	//	}
	//
	//}
	
	
	
	
	public function edit_feeds($id=null)
	{
		if (!$this->ion_auth->logged_in() && !$this->ion_auth->is_admin())
		{
			show_404();
		}		
		if(!isset($id)){
			show_404();
		}
		
		try{
			$crud = new grocery_CRUD();

			$crud->set_theme('twitter-bootstrap');
			
			$crud->where('users_id',$id);	
			$crud->set_table('feeds');
			$crud->columns('link','description');
			$crud->fields('link','description','users_id');
			$crud->change_field_type('users_id', 'hidden', $id);			
			
			

			$output = $crud->render();
			$this->_example_output($output);

		}catch(Exception $e){
			show_error($e->getMessage().' --- '.$e->getTraceAsString());
		}
	}

	

}