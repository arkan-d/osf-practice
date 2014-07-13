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
		}elseif($this->ion_auth->is_admin()) {
			redirect('auth');
		}
		
		$this->load->model('feeds_model');
		$this->load->library('form_validation');
		$this->load->helper('form');
	}
	
	
	public function index()
	{
		$user = $this->session->userdata('user_id');
		$data['title'] = "Home";
		/**
		 *@todo load feeds by id
		*/
		
		$data['info'] = $this->feeds_model->get_feeds_sources($user);
		$this->load->view('templates/header',$data);
		$this->load->view('templates/nav');
		$this->load->view('welcome_page',$data);
		$this->load->view('templates/footer');
	}
	
	
	
	/**
	 *insert new post in DB
	 *
	 *
	 */
	function new_rss_source(){
		$data['title'] = "Insert";
		
		$this->form_validation->set_rules('rss_feed', "rss_feed", 'required|xss_clean');		
		if ($this->form_validation->run() == true)		{
			$url = $this->input->post('rss_feed');
			$this->load->library('rssparser');
			//$url= "http://feeds.bbci.co.uk/news/rss.xml"; 
			// Get all items from arstechnica
			//return  $this->rssparser->set_feed_url($url)->set_cache_life(30)->getFeed(0);
			redirect('main/new_rss_source/','refresh');
			
		}else{
			//$this->data['message'] = validation_errors();
			$this->load->view('templates/header',$data); //@see views/header.php
			$this->load->view('templates/nav'); //@see views/nav.php
			$this->load->view('new_feed',$data);//@see views/new_post.php
			$this->load->view('templates/footer'); //@see views/footer.php
		}
	}
	
	
	/**
	*@todo function to handle url address is valid rss or NO
	*
	*/    
	
	
	/**
	 *@var string  valid url adress
	 *
	 *@todo check for sql/xss injections
	 */
       
        function single_feed(){
	
	$data['title'] = "Single";
	       // Load RSS Parser
	$data['rss'] = $this->feeds_model->rss_posts();
 
	$this->load->view('templates/header',$data);
	$this->load->view('templates/nav');
	$this->load->view('single',$data);
	$this->load->view('templates/footer');
	    
        }
	
	function edit_profile(){}
	
	function all_rss_posts(){}
		
	function edit_feeds (){}
	
}

/* End of file main.php */
/* Location: ./application/modules/main/controllers/main.php */