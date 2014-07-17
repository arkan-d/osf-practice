<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Route extends CI_Controller {
    
    function __construct()
	{
		parent::__construct();
		if (!$this->ion_auth->logged_in())
		{
			redirect('auth/login');	
		}elseif($this->ion_auth->is_admin()) {
			redirect('admin');
		}elseif($this->ion_auth->logged_in()){
			redirect('user');
		}
		
		
		
		
	}
    
    
    
}