<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * User Controller
 */
class User extends CI_Controller {

	public function index()
	{	    
		
	$this->load->view('templates/header');        
        $this->load->view('login');
        $this->load->view('templates/footer'); 
	}
        
	
	
	
        
        
}

/* End of file user.php */
/* Location: ./application/controllers/user.php */