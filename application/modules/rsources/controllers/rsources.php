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
		$this->load->library('rssparser');
		$url= "http://feeds.bbci.co.uk/news/rss.xml"; 
	       // Get 6 items from arstechnica
	       $data['rss'] = $this->rssparser->set_feed_url($url)->set_cache_life(30)->getFeed(0);
		   
		//http://www.spiegel.de/schlagzeilen/tops/index.rss           
		//http://feeds.feedburner.com/ruseller/CdHX/
	 
		$this->load->view('templates/header',$data);
		$this->load->view('templates/nav');
		$this->load->view('single',$data);
		$this->load->view('templates/footer');
		    
	       }
	
    
}
/* End of file rsources.php */
/* Location: ./application/modules/main/controllers/rsources.php */