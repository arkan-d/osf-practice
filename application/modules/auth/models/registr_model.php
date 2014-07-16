<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Registr_model extends CI_Model
{
    
    public function __construct()
	{
		parent::__construct();
        }
    
    function get_email(){
        $this->db->select('email');
        $this->db->from('users');
        $this->db->where('id',4);
        $this->db->limit(1);
        $query = $this->db->get();
        return $query->result_array(); 
    }
    
    
    
}//end