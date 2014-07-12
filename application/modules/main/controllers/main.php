<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Main extends CI_controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 
	 
	 
	 */
	
	function __construct()
	{
		parent::__construct();
			if (!$this->ion_auth->logged_in())
		{
			redirect('auth/login');
		}
		
	}
	
	
	public function index()
	{
		$user = $this->session->userdata('user_id');
		$data['title'] = "Home";
		/**
		 *@todo load feeds by id
		*/
		$this->load->model('feeds');
		$data['info'] = $this->feeds->get_feeds_sources($user);
		$data['count'] = $this->feeds->get_feeds_count($user);
		$this->load->view('templates/header',$data);
		$this->load->view('templates/nav');
		$this->load->view('dashboard',$data);
		$this->load->view('templates/footer');
	}
	
	
	
		
	
}

/* End of file main.php */
/* Location: ./application/modules/main/controllers/main.php */