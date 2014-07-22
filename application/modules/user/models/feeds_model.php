<?php

if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Feeds_model extends CI_Model{
    
        
                /**
		* 
		* @param int $start initial post id
		* @param int $num the last post id
		* @return array posts in assoc array
		*/
	       function get_feeds_sources($id,$favourite=1){	
                    
                    $this->db->select('*');
                    $this->db->from('feeds'); 
                    $this->db->where("users_id",$id);
		    $this->db->where("favourite",$favourite);
		    $this->db->order_by('id','desc');
                    $query = $this->db->get();
                    return $query->result_array();	       
	       }
	       
	       function get_all_feeds($user){
		    $this->db->select('*');
                    $this->db->from('feeds'); 
                    $this->db->where("users_id",$user);
                    $query = $this->db->get();
                    return $query->result_array();
	       }
               
	       function insert_feed($user,$feed,$rss){
		    $this->db->insert('feeds',$feed);
		    $this->db->where('users_id',$user);
		    $feeds_id =  $this->db->insert_id();
		   		    
		 foreach($rss as $post => $data){
			 $rss[$post]['feeds_id'] = $feeds_id;
			 unset($rss[$post]['pubDate']);
			 unset($rss[$post]['author']);
		 }	  
			
		   $this->db->insert_batch('rss_posts',$rss);
		  
		    
	       }
	       
	      function rss_posts($feed_id){
		    $this->db->select('*');
		    $this->db->from('rss_posts');
		    $this->db->where('feeds_id',$feed_id);
		    $this->db->limit(100);
		    $query = $this->db->get();
		    
		    return  $query->result_array();
	      }
	      
	      
	      
	       
	      
	      
	      
	       
	       
}
/* End of file feeds.php */
/* Location: ./application/models/ */