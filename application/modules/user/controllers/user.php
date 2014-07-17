<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User extends CI_controller {

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
		
		if ($this->config->item('installed') === 'no'){
			
			redirect(base_url());
		}
		
		$this->load->library('grocery_CRUD');
		$this->load->model('feeds_model');
		$this->load->library('form_validation');
		$this->load->helper('form');
		
		
	}
	
	
	public function index()
	{
		
		$data['title']="Welcome";
		
		if (!$this->ion_auth->logged_in())
		{
			//redirect them to the login page
			redirect('auth/login');
		}
		if ($this->ion_auth->is_admin()) {
			redirect('admin');
		}
		
		$data['user']=  $this->session->userdata('user_id');
		$user = $this->session->userdata('user_id');
		$data['favourite']= $this->feeds_model->get_feeds_sources($user);
		/**
		 *@todo load feeds by id
		*/
		
		//$data['info'] = $this->feeds_model->get_feeds_sources($user,1);
		$this->load->view('templates/header',$data);
		$this->load->view('templates/nav');
		$this->load->view('main_page',$data);
		$this->load->view('templates/footer');
	}
	
	function add_feed(){
		
		
		$this->form_validation->set_rules('url', "Url", 'required|xss_clean');
		if ($this->form_validation->run() == TRUE){
			$data['url'] = array(
			'url' => $_POST['url'],			
			);
			
		$user = $this->session->userdata('user_id');		
		$this->feeds_model->insert_feed($user,$data);
		
		redirect('user/add_feed','refresh');
		}else{
			$this->session->set_flashdata('message',validation_errors());			
			$data['message'] = $this->session->flashdata('message');
			$data['message'] = validation_errors();
			$data['title'] = 'Add feed';
			$this->load->view('templates/header',$data);
			$this->load->view('templates/nav');
			$this->load->view('add_feed',$data);
			$this->load->view('templates/footer');
		}
	}
		
		
		
	public function edit_feeds($id=null)
	{
		if (!$this->ion_auth->logged_in() || (!$this->ion_auth->is_admin() && !($this->ion_auth->user()->row()->id == $id)))
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
			$crud->columns('link','description','favourite');
			$crud->fields('link','description','users_id','favourite');
			$crud->change_field_type('users_id', 'hidden', $id);			
			
			

			$output = $crud->render();
			$this->_example_output($output);

		}catch(Exception $e){
			show_error($e->getMessage().' --- '.$e->getTraceAsString());
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
	
	
	
	function _get_csrf_nonce()
	{
		$this->load->helper('string');
		$key   = random_string('alnum', 8);
		$value = random_string('alnum', 20);
		$this->session->set_flashdata('csrfkey', $key);
		$this->session->set_flashdata('csrfvalue', $value);

		return array($key => $value);
	}

	function _valid_csrf_nonce()
	{
		if ($this->input->post($this->session->flashdata('csrfkey')) !== FALSE &&
			$this->input->post($this->session->flashdata('csrfkey')) == $this->session->flashdata('csrfvalue'))
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		}
	}

	function _render_page($view, $data=null, $render=false)
	{

		$this->viewdata = (empty($data)) ? $this->data: $data;
			
		$this->load->view('templates/header',$data);
		$this->load->view('templates/nav',$data);
		$view_html = $this->load->view($view, $this->viewdata, $render);
		$this->load->view('templates/footer'); 

		if (!$render) return $view_html;
	}
	
	public function _example_output($output = null)	
	{
		
		$this->load->view('edit_feeds',$output);
		$this->load->view('templates/footer');
		
	}
		
	
	
}

/* End of file main.php */
/* Location: ./application/modules/main/controllers/main.php */