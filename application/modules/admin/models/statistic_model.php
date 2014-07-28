<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Statistic_model extends CI_Model
{
    public function __construct()
	{
		parent::__construct();
		$this->load->database();
		
        }
    
    
    
    function log($user){
        $this->db->select('last_login,email,created_on');
        $this->db->from('users');
        $this->db->where('id',$user);        
        $query = $this->db->get();        
        return $query->result_array();
  
        
    }
    
    
    
    function visitor_info($user){
         $this->db->select('timestamp,client_user_agent,referer_page,client_ip');
        $this->db->from('usertracking');
        $this->db->where('user_identifier',$user);
	$this->db->order_by('id','desc');
	$this->db->limit(20);
        $query = $this->db->get();
        
        return $query->result_array();
        
    }
    
    
    function popular_feeds(){
	$this->db->select('link,sum(views)')
		 ->from('feeds')
		 ->where('views >',0)		 
		 ->group_by('link')
		 ->order_by('sum(views)','desc')
		 ->limit(10);
	$query  = $this->db->get();
	return $query->result_array();
	
    
	
    }
    
    
    
    
    
}/**
  *end file statistic_MODEL.PHP
  *
  */