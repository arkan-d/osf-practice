<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Error extends CI_Controller 
{

    public function index() 
    { 
        $this->output->set_status_header('404'); 
        $data['content'] = 'my404'; // View name 
        $this->load->view('my404',$data);//loading in my template 
    }
    
    
    
    
} 
