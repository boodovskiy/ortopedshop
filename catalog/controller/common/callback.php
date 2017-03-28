<?php
class ControllerCommonCallback extends Controller {

 public function index() {
 
 }
  
 public function sendmailCustom (){
 ($this->request->post['name']) ? $name = $this->request->post['name']:'empty';
 ($this->request->post['message']) ? $message = $this->request->post['message']:'empty';
 ($this->request->post['phone']) ? $phone = $this->request->post['phone']:'empty';
 ($this->request->post['email']) ? $email = $this->request->post['email']:'empty';
 ($this->request->post['subject']) ? $subject = $this->request->post['subject']:'empty';
 $json = array();
 $json['name'] = $name;
 $json['message'] = $message;
 $json['phone'] = $phone;
 $json['email'] = $email;
 $json['subject'] = $subject;
//$this->response->addHeader('Content-type: application/json; charset=utf-8');
//$this->response->setOutput(json_encode($json));

$sendmail = '
<html>
<head>
  <title>' . $subject . '</title>
</head>
<body>
 <hr>
  <table>
    <tr>
      <td>Имя : </td><td>' . $name . '</td>
    </tr>
    <tr>
      <td>Телефон : </td><td>' . $phone . '</td>
    </tr>
    <tr>
      <td>Адрес : </td><td>' . $email . '</td>
    </tr>
	 <tr>
      <td>Тема : </td><td>' . $subject . '</td>
    </tr>
  </table>
<hr>
<p>' . $message . ' </p>
</body>
</html>
';
    
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($this->config->get('config_email'));
 			//$mail->setTo('asrudoy@gmail.com');
			//$mail->setTo('budovskiy@specialcase.net');
			//$mail->setTo('info@ortopedshop.ru');
			//$mail->setFrom($email);
			$mail->setFrom('info@ortopedshop.ru');
			$mail->setSender(html_entity_decode($name, ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(html_entity_decode(sprintf($subject, $name), ENT_QUOTES, 'UTF-8'));
			$mail->setHtml($sendmail);
			$mail->setText($sendmail);
			$mail->send();

			
$sendBackMail ='
<html>
<head>
  <title>OrtopedShop.ru</title>
</head>
<body>
<h3>Спасибо, Ваша заявка принята. </h3><p>В ближайшее время с Вами свяжеться менеджер нашего интернет магазина. </p><p>С ув. ortopedShop.ru</p>
<h4>Вы отправляли:</h4>
 <hr>
  <table>
    <tr>
      <td>Имя : </td><td>' . $name . '</td>
    </tr>
    <tr>
      <td>Телефон : </td><td>' . $phone . '</td>
    </tr>
    <tr>
      <td>Адрес : </td><td>' . $email . '</td>
    </tr>
	 <tr>
      <td>Тема : </td><td>' . $subject . '</td>
    </tr>
  </table>
<hr>
<p>' . $message . ' </p>
</body>
</html>
';

// Для отправки HTML-письма должен быть установлен заголовок Content-type
$headers  = 'MIME-Version: 1.0' . "\r\n";
//$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
//$headers .= "Content-type: text/html; charset=windows-1251 \r\n";
//$header .= 'Content-type: text/plain; charset=\"utf-8\"';
$headers .= "Content-type: text/html; charset=utf-8 \r\n";

$headers .= 'From: OrtopedShop.ru <'.$this->config->get('config_email').'>\r\n';
//$headers .= 'Return-Path: <return@ortopedshop.ru>\r\n';
//$headers .= 'From: OrtopedShop.ru <info@ortopedshop.ru>\r\n'; 
//$headers .= 'From: OrtopedShop.ru <dzakdn@yandex.ru>\r\n';

// Отправляем
$this->response->addHeader('Content-type: text/plain; charset=utf-8');
if(mail($email, $subject, $sendBackMail, $headers, " -f return@ortopedshop.ru")) $this->response->setOutput('1');
else $this->response->setOutput('Не могу отправить письмо');
 
 }
}