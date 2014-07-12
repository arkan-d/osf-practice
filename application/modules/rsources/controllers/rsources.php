<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Rsources extends CI_controller {
    
    
                function __construct()
                {
                    parent::__construct();
                    if (!$this->ion_auth->logged_in())
                    {
                    redirect('auth/login');
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
		$this->load->model('feeds_model');
		$data['rss'] = $this->feeds_model->rss_posts();
	 
		$this->load->view('templates/header',$data);
		$this->load->view('templates/nav');
		$this->load->view('main/single',$data);
		$this->load->view('templates/footer');
		    
	       }
	       
	       
	       
	
    
}
/* End of file rsources.php */
/* Location: ./application/modules/main/controllers/rsources.php */