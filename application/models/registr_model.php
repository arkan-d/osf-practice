<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Registr_model extends CI_Model
{
    
    
     
        
        function get_user_for_statistic($id){
            $this->db->select('email');
            $this->db->from('users');
            $this->db->where('id',$id);
            $query = $this->db->get();		    
	    return  $query->result_array();
        }
    
    
}//end