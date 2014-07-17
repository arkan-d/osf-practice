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
                    $query = $this->db->get();
                    return $query->result_array();	       
	       }
               
	       
	       
	      function rss_posts(){
	       $this->load->library('rssparser');
		$url= "http://feeds.bbci.co.uk/news/rss.xml"; 
	       // Get all items from arstechnica
	       return  $this->rssparser->set_feed_url($url)->set_cache_life(30)->getFeed(0);
		   
		//http://www.spiegel.de/schlagzeilen/tops/index.rss           
		//http://feeds.feedburner.com/ruseller/CdHX/
	      }
	      
	      
	      
	      function get_feeds_count ($id){
                return count ($this->feeds_model->get_all_feeds($id));
               }
	       
	      
	      
	      
	       
	       
}
/* End of file feeds.php */
/* Location: ./application/models/ */