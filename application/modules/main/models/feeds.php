<?php

if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Feeds extends CI_Model{
    
        
            
            /**
            * Get a total count of posts from database
            * 
            * @return int
            */
           //function get_feeds_count(){
           //    $this->db->select('id')->from('rss_posts')->where('',1);
           //    $query = $this->db->get();
           //    return $query->num_rows();
           //}
            
        
                /**
		* 
		* @param int $start initial post id
		* @param int $num the last post id
		* @return array posts in assoc array
		*/
	       function get_feeds_sources($id){	
                    
                    $this->db->select('feeds.*');
                    $this->db->from('feeds');                    
                    $this->db->join("user_feeds", "user_feeds.feeds_id = feeds.id","inner");
                    //$this->db->join("users","users_id = users.id","inner");                    
                    $this->db->where("users_id",$id); 
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