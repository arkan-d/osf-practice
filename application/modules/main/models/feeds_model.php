<?php

if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Feeds_model extends CI_Model{
    
        
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
                return count ($this->feeds_model->get_feeds_sources($id));
               }
	       
	       
	      function rss_posts(){
	       $this->load->library('rssparser');
		$url= "http://feeds.bbci.co.uk/news/rss.xml"; 
	       // Get all items from arstechnica
	       return  $this->rssparser->set_feed_url($url)->set_cache_life(30)->getFeed(0);
		   
		//http://www.spiegel.de/schlagzeilen/tops/index.rss           
		//http://feeds.feedburner.com/ruseller/CdHX/
	      }
	      
	      function add_new_rss_source(){
	       
	      }
	      
	      function update_rss_source(){
	       
	      }
	      
	      function del_rss_source(){
	       
	      }
	      
	       
	       
}
/* End of file feeds.php */
/* Location: ./application/models/ */