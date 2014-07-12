<?php

if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Feeds extends CI_Model{
    
        
                /**
		* 
		* @param int $start initial post id
		* @param int $num the last post id
		* @return array posts in assoc array
		*/
	       function get_feeds_sources($id,$favourite=null){	
                    
                    $this->db->select('feeds.*');
                    $this->db->from('feeds');                    
                    $this->db->join("user_feeds", "user_feeds.feeds_id = feeds.id","inner");
		    //$this->db->join("user_feeds", "user_feeds.feeds_id = user_feeds.favourite","inner");
                    //$this->db->join("users","users_id = users.id","inner");                    
                    $this->db->where("users_id",$id);
		    $this->db->where("favourite",$favourite);
                    $query = $this->db->get();
                    return $query->result_array();
                    
                    //return array(
                    //'query' => $query,
                    //'count' => count($query)
                    // );	       
	       }
               
               function get_feeds_count ($id){
                return count ($this->feeds->get_feeds_sources($id));
               }
	       
	      
	       
	       
}
/* End of file feeds.php */
/* Location: ./application/models/ */