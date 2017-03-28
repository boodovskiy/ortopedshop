<?php
class ControllerModuleCustomizePriceFilter extends Controller {
	private $error = array(); 
	public $data=array(); 
	public function index() {   
		$this->load->language('module/customizepricefilter');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			$this->model_setting_setting->editSetting('customizepricefilter', $this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');
			
						
			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		
		$this->data['entry_button_color'] = $this->language->get('entry_button_color');
		$this->data['entry_filled_color'] = $this->language->get('entry_filled_color');
		$this->data['entry_reset_button'] = $this->language->get('entry_reset_button');
		$this->data['entry_step'] = $this->language->get('entry_step');
		$this->data['entry_margin'] = $this->language->get('entry_margin');
		$this->data['entry_direction'] = $this->language->get('entry_direction');
		$this->data['entry_orientation'] = $this->language->get('entry_orientation');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $this->data['entry_lower_limit'] = $this->language->get('entry_lower_limit');
        $this->data['entry_upper_limit'] = $this->language->get('entry_upper_limit');
		$this->data['entry_slider_thickness'] = $this->language->get('entry_slider_thickness');
		$this->data['entry_default_theme'] = $this->language->get('entry_default_theme');
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
                

		
		$this->data['tab_module'] = $this->language->get('tab_module');
		
		$this->data['token'] = $this->session->data['token'];

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/customizepricefilter', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/customizepricefilter', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['modules'] = array();
		
		
		if (isset($this->request->post['customizepricefilter_status'])) {
			$this->data['customizepricefilter_status'] = $this->request->post['customizepricefilter_status'];
		} else {
			$this->data['customizepricefilter_status'] = $this->config->get('customizepricefilter_status');
		}
        if (isset($this->request->post['customizepricefilter_sort_order'])) {
			$this->data['customizepricefilter_sort_order'] = $this->request->post['customizepricefilter_sort_order'];
		} else {
			$this->data['customizepricefilter_sort_order'] = $this->config->get('customizepricefilter_sort_order');
		}
		if (isset($this->request->post['customizepricefilter_lowerlimit'])) {
			$this->data['customizepricefilter_lowerlimit'] = $this->request->post['customizepricefilter_lowerlimit'];
		} else {
			$this->data['customizepricefilter_lowerlimit'] = $this->config->get('customizepricefilter_lowerlimit');
		}
		if (isset($this->request->post['customizepricefilter_upperlimit'])) {
			$this->data['customizepricefilter_upperlimit'] = $this->request->post['customizepricefilter_upperlimit'];
		} else {
			$this->data['customizepricefilter_upperlimit'] = $this->config->get('customizepricefilter_upperlimit');
		}
		if (isset($this->request->post['customizepricefilter_step'])) {
			$this->data['customizepricefilter_step'] = $this->request->post['customizepricefilter_step'];
		} else {
			$this->data['customizepricefilter_step'] = $this->config->get('customizepricefilter_step');
		}
		if (isset($this->request->post['customizepricefilter_margin'])) {
			$this->data['customizepricefilter_margin'] = $this->request->post['customizepricefilter_margin'];
		} else {
			$this->data['customizepricefilter_margin'] = $this->config->get('customizepricefilter_margin');
		} 
		if (isset($this->request->post['customizepricefilter_direction'])) {
			$this->data['customizepricefilter_direction'] = $this->request->post['customizepricefilter_direction'];
		} else {
			$this->data['customizepricefilter_direction'] = $this->config->get('customizepricefilter_direction');
		}    
		if (isset($this->request->post['customizepricefilter_button_color'])) {
			$this->data['customizepricefilter_button_color'] = $this->request->post['customizepricefilter_button_color'];
		} else {
			$this->data['customizepricefilter_button_color'] = $this->config->get('customizepricefilter_button_color');
		}
		if (isset($this->request->post['customizepricefilter_filled_color'])) {
			$this->data['customizepricefilter_filled_color'] = $this->request->post['customizepricefilter_filled_color'];
		} else {
			$this->data['customizepricefilter_filled_color'] = $this->config->get('customizepricefilter_filled_color');
		}
		if (isset($this->request->post['customizepricefilter_reset_button']) or $this->config->get('customizepricefilter_reset_button')) {
			$this->data['checked'] = 'checked';
		} else {
			$this->data['checked'] = '';
		}
		if (isset($this->request->post['customizepricefilter_orientation'])) {
			$this->data['customizepricefilter_orientation'] = $this->request->post['customizepricefilter_orientation'];
		} else {
			$this->data['customizepricefilter_orientation'] = $this->config->get('customizepricefilter_orientation');
		}
		if (isset($this->request->post['customizepricefilter_thickness'])) {
			$this->data['customizepricefilter_thickness'] = $this->request->post['customizepricefilter_thickness'];
		} else {
			$this->data['customizepricefilter_thickness'] = $this->config->get('customizepricefilter_thickness');
		}
		if (isset($this->request->post['customizepricefilter_theme'])) {
			$this->data['customizepricefilter_theme'] = $this->request->post['customizepricefilter_theme'];
		} else if($this->config->get('customizepricefilter_theme')){
			$this->data['customizepricefilter_theme'] = $this->config->get('customizepricefilter_theme');
		}
		else $this->data['customizepricefilter_theme'] ='1';
		
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
        		
		//$this->response->setOutput($this->render());
		$this->data['header'] = $this->load->controller('common/header');
		$this->data['column_left'] = $this->load->controller('common/column_left');
		$this->data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/customizepricefilter.tpl', $this->data));
		//var_dump($this->data['checked']);
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/customizepricefilter')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>
