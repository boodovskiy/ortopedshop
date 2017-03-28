<?php  
class ControllerModuleCustomizePriceFilter extends Controller {
	public $data=array(); 
	public function index() {
		$this->language->load('module/customizepricefilter');
		$this->children = array(
			'module/language',
			'module/currency',
			'module/cart'
		);
    	$this->data['heading_title'] = sprintf($this->language->get('heading_title'), $this->config->get('config_name'));
    	$this->data['text_filter_price']=$this->language->get('text_filter_price');
    	$setting=array();
		$setting['customizepricefilter_upperlimit']=$this->config->get('customizepricefilter_upperlimit');
		$setting['customizepricefilter_lowerlimit']=$this->config->get('customizepricefilter_lowerlimit');
		if($this->config->get('customizepricefilter_step'))
			$this->data['customizepricefilter_step']=$this->config->get('customizepricefilter_step');
		else
			$this->data['customizepricefilter_step']=100;
		if($this->config->get('customizepricefilter_margin'))	
			$this->data['customizepricefilter_margin']=$this->config->get('customizepricefilter_margin');
		else
			$this->data['customizepricefilter_margin']=500;
		if($this->config->get('customizepricefilter_direction'))
			$this->data['customizepricefilter_direction']=$this->config->get('customizepricefilter_direction');
		else 
			$this->data['customizepricefilter_direction']='ltr';
		$this->data['customizepricefilter_button_color']=$this->config->get('customizepricefilter_button_color');
		$this->data['customizepricefilter_filled_color']=$this->config->get('customizepricefilter_filled_color');
		$this->data['customizepricefilter_reset_button']=$this->config->get('customizepricefilter_reset_button');
		if($this->config->get('customizepricefilter_orientation'))
			$this->data['customizepricefilter_orientation']=$this->config->get('customizepricefilter_orientation');
		else
			$this->data['customizepricefilter_orientation']='horizontal';
		if(!isset($this->session->data['lower'])) $this->session->data['lower']='';
		if(!isset($this->session->data['higher'])) $this->session->data['higher']='';
		if($this->session->data['lower'] or $this->session->data['higher'])
		{
			$this->data['upperlimit']=$this->session->data['higher'];
			$this->data['lowerlimit']=$this->session->data['lower'];
		}
		else
		{
			if ($setting['customizepricefilter_upperlimit']) {
			$this->data['upperlimit'] = $setting['customizepricefilter_upperlimit'];
			}
			else
			{
				$this->data['upperlimit'] = 10000;
			}
			$this->session->data['higher']=$this->data['upperlimit'];
		
			if ($setting['customizepricefilter_lowerlimit']) {
			$this->data['lowerlimit'] = $setting['customizepricefilter_lowerlimit'];
			}
			else
			{
				$this->data['lowerlimit'] = 0;
			}
           $this->session->data['lower']=$this->data['lowerlimit'];	
		}
		$this->data['clowerlimit']=$this->currency->format($this->data['lowerlimit']);
		$this->data['cupperlimit']=$this->currency->format($this->data['upperlimit']);
		$this->data['max']=$setting['customizepricefilter_upperlimit'];
		$this->data['min']=$setting['customizepricefilter_lowerlimit'];
		$this->data['theme']=$this->config->get('customizepricefilter_theme');
		if (isset($this->request->get['_route_'])) {
			$parts = explode('/', $this->request->get['_route_']);

			// remove any empty arrays from trailing
			if (utf8_strlen(end($parts)) == 0) {
				array_pop($parts);
			}

			foreach ($parts as $part) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($part) . "'");

				if ($query->num_rows) {
					$url = explode('=', $query->row['query']);
					if ($url[0] == 'category_id') {
						if (!isset($this->request->get['path'])) {
							$this->request->get['path'] = $url[1];
						} else {
							$this->request->get['path'] .= '_' . $url[1];
						}
					}
				}
			}
		}
		$this->data['target']='index.php?route=product/category_customizepricefilter&path='.$this->request->get['path'];
		$this->data['customizepricefilter_thickness']=str_replace('px','',$this->config->get('customizepricefilter_thickness'));
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/customizepricefilter.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/customizepricefilter.tpl';
		} else {
			$this->template = 'default/template/module/customizepricefilter.tpl';
		}
		
		return $this->load->view($this->template, $this->data);
	}
}
?><?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>
