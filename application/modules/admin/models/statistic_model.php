<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Statistic_model extends CI_Model
{
    public function __construct()
	{
		parent::__construct();
		$this->load->database();
		
        }
    
    
    
    function last_login($user){
        $this->db->select('last_login');
        $this->db->from('users');
        $this->db->where('id',$user);
        $this->db->limit(1);
        $query = $this->db->get();
        
        return $query->first_row('array');
  
        
    }
    
    
    function created_on ($user){
        
        $this->db->select('created_on');
        $this->db->from('users');
        $this->db->where('id',$user);
        $this->db->limit(1);
        $query = $this->db->get();
        
        return $query->first_row('array');
        
    }
    
    
    function visitor_info($user){
         $this->db->select('timestamp,client_user_agent,referer_page');
        $this->db->from('usertraking');
        $this->db->where('user_identifier',$user);
        $query = $this->db->get();
        
        return $query->result_array();
        
    }
    
    
    
    
    
    
}/**
  *end file statistic_MODEL.PHP
  *
  */