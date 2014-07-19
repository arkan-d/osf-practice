<?php (defined('BASEPATH')) OR exit('No direct script access allowed');

/**
 * Modular Extensions - HMVC
 *
 * Adapted from the CodeIgniter Core Classes
 * @link	http://codeigniter.com
 *
 * Description:
 * This library extends the CodeIgniter CI_Config class
 * and adds features allowing use of modules and the HMVC design pattern.
 *
 * Install this file as application/third_party/MX/Config.php
 *
 * @copyright	Copyright (c) 2011 Wiredesignz
 * @version 	5.4
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 **/
class MX_Config extends CI_Config 
{	
	public function load($file = 'config', $use_sections = FALSE, $fail_gracefully = FALSE, $_module = '') {
		
		if (in_array($file, $this->is_loaded, TRUE)) return $this->item($file);

		$_module OR $_module = CI::$APP->router->fetch_module();
		list($path, $file) = Modules::find($file, $_module, 'config/');
		
		if ($path === FALSE) {
			parent::load($file, $use_sections, $fail_gracefully);					
			return $this->item($file);
		}  
		
		if ($config = Modules::load_file($file, $path, 'config')) {
			
			/* reference to the config array */
			$current_config =& $this->config;

			if ($use_sections === TRUE)	{
				
				if (isset($current_config[$file])) {
					$current_config[$file] = array_merge($current_config[$file], $config);
				} else {
					$current_config[$file] = $config;
				}
				
			} else {
				$current_config = array_merge($current_config, $config);
			}
			$this->is_loaded[] = $file;
			unset($config);
			return $this->item($file);
		}
	}
	
	/*===========================================================================================================*/
	
	var $config_path 		= ''; // Set in the constructor below
	var $database_path		= ''; // Set in the constructor below

	/**
	 * Constructor
	 *
	 * @access	public
	 * @return	void
	 */
	function __construct()
	{
		parent::__construct();
		$this->config_path		= APPPATH.'config/config'.EXT;
		$this->database_path	= APPPATH.'config/database'.EXT;
	}
	
	// --------------------------------------------------------------------

	/**
	 * Update the config file
	 *
	 * Reads the existing config file as a string and swaps out
	 * any values passed to the function.  Will alternately remove values
	 *
	 *
	 * @access	public
	 * @param	array
	 * @param	array
	 * @return	bool
	 */
	function config_update($config_array = array())
	{
		if ( ! is_array($config_array) && count($config_array) == 0)
		{
			return FALSE;
		}

		@chmod($this->config_path, FILE_WRITE_MODE);

		// Is the config file writable?
		if ( ! is_really_writable($this->config_path))
		{
			show_error($this->config_path.' does not appear to have the proper file permissions.  Please make the file writeable.');
		}

		// Read the config file as PHP
		require $this->config_path;

		// load the file helper
		$this->CI =& get_instance();
		$this->CI->load->helper('file');

		// Read the config data as a string
		$config_file = read_file($this->config_path);

		// Trim it
		$config_file = trim($config_file);


		// Do we need to add totally new items to the config file?
		if (is_array($config_array))
		{
			foreach ($config_array as $key => $val)
			{			
		 		$pattern = '/\$config\[\\\''.$key.'\\\'\]\s+=\s+[^\;]+/';
		    	$replace = "\$config['$key'] = '$val'";              
	        	$config_file = preg_replace($pattern, $replace, $config_file);
			}	
		}
		
		if ( ! $fp = fopen($this->config_path, FOPEN_WRITE_CREATE_DESTRUCTIVE))
		{
			return FALSE;
		}

		flock($fp, LOCK_EX);
		fwrite($fp, $config_file, strlen($config_file));
		flock($fp, LOCK_UN);
		fclose($fp);

		@chmod($this->config_path, FILE_READ_MODE);

		return TRUE;
	}

	// --------------------------------------------------------------------

	/**
	 * Update Database Config File
	 *
	 * Reads the existing DB config file as a string and swaps out
	 * any values passed to the function.
	 *
	 * @access	public
	 * @param	array
	 * @param	array
	 * @return	bool
	 */
	function db_config_update($dbconfig = array(), $remove_values = array())
	{
		@chmod($this->database_path, FILE_WRITE_MODE);

		// Is the database file writable?
		if ( ! is_really_writable($this->database_path))
		{
			show_error($this->database_path.' does not appear to have the proper file permissions.  Please make the file writeable.');
		}

		// load the file helper
		$this->CI =& get_instance();
		$this->CI->load->helper('file');

		// Read the config file as PHP
		require $this->database_path;

		// Now we read the file data as a string
		$config_file = read_file($this->database_path);

		if (count($dbconfig) > 0)
		{
			foreach ($dbconfig as $key => $val)
			{

			 	$pattern = '/\$db\[\\\''.$active_group.'\\\'\]\[\\\''.$key.'\\\'\]\s+=\s+[^\;]+/';
			    $replace = "\$db['$active_group']['$key'] = '$val'";              
		        $config_file = preg_replace($pattern, $replace, $config_file);

			}
		}

		$config_file = trim($config_file);

		// Write the file
		if ( ! $fp = fopen($this->database_path, FOPEN_WRITE_CREATE_DESTRUCTIVE))
		{
			return FALSE;
		}

		flock($fp, LOCK_EX);
		fwrite($fp, $config_file, strlen($config_file));
		flock($fp, LOCK_UN);
		fclose($fp);

		@chmod($this->database_path, FILE_READ_MODE);

		return TRUE;
	}
	
	// --------------------------------------------------------------------

	/**
	 * Config status
	 *
	 * Checks the status of the config files and database connection
	 *
	 * @access	public
	 * @return	array
	 */
	function config_status()
	{

		$data['install_warnings'] = array();

		// is PHP version ok?
		if (!is_php('5.1.6'))
		{
			$data['install_warnings'][] = 'php version is too old';
		}

		// is config file writable?
		if (is_really_writable($this->config_path) && ! @chmod($this->config_path, FILE_WRITE_MODE))
		{
			$data['install_warnings'][] = 'config.php file is not writable';
		}

		// Is there a database.php file?
		if (@include($this->database_path))
		{
			if ($this->test_mysql_connection($db[$active_group]))
			{
				$this->session->set_userdata('user_database_file', TRUE);
			}
			else
			{
				// Ensure the session isn't remembered from a previous test
				$this->session->set_userdata('user_database_file', FALSE);

				@chmod($this->config->database_path, FILE_WRITE_MODE);

				if (is_really_writable($this->config->database_path) === FALSE)
				{
					$vars['install_warnings'][] = 'database file is not writable';
				}
			}
		}
		else
		{
			$data['install_warnings'][] = 'database config file was not found';
		}

		return $data;
	}	
	/*===============================================================================================*/
}