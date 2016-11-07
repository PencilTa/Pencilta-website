<?php
$subject = $_REQUEST['subject'] . 'Penta: Business Bank Accounts Made Easy.'; // Subject of your email
$to = 'hello@getpenta.com';  //Recipient's or Your E-mail

$headers  = 'MIME-Version: 1.0' . "\r\n";
$headers .= "From: " . $_REQUEST['email'] . "\r\n"; // Sender's E-mail
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

$message .= 'Email: ' . $_REQUEST['email'] . "<br>";
$message .= $_REQUEST['message'];

if (@mail($to, $subject, $message, $headers))
{
	// Transfer the value 'sent' to ajax function for showing success message.
	echo 'THANKS FOR SUBSCRIBING!';
	// header('Location: index.html');
}
else
{
	// Transfer the value 'failed' to ajax function for showing error message.
	echo 'failed';
}
?>
