<?php
// require('connection.inc.php');
// require('functions.inc.php');

// $email=get_safe_value($con,$_POST['email']);
// $res=mysqli_query($con,"select * from users where email='$email'");
// $check_user=mysqli_num_rows($res);

// if($check_user>0){
// 	$row=mysqli_fetch_assoc($res);
// 	$pwd=$row['password'];
// 	$html="Your password is <strong>$pwd</strong>";
// 	include('smtp/PHPMailerAutoload.php');
// 	$mail=new PHPMailer(true);
// 	$mail->isSMTP();
// 	$mail->Host="smtp.gmail.com";
// 	$mail->Port=587;
// 	$mail->SMTPSecure="tls";
// 	$mail->SMTPAuth=true;
// 	$mail->Username="talatishubham04@gmail.com";
// 	$mail->Password="Shubham@2001";
// 	$mail->SetFrom("SMTP_EMAIL");
// 	$mail->addAddress($email);
// 	$mail->IsHTML(true);
// 	$mail->Subject="Your Password";
// 	$mail->Body=$html;
// 	$mail->SMTPOptions=array('ssl'=>array(
// 		'verify_peer'=>false,
// 		'verify_peer_name'=>false,
// 		'allow_self_signed'=>false
// 	));
// 	if($mail->send()){
// 		echo "Please check your email id for password";
// 	}else{
// 		//echo "Error occur";
// 	}
// }else{
// 	echo "Email id not registered with us";
// 	die();
// }
?>
<?php 

function send_mail($to, $message, $subject){
	
	$mail = new PHPMailer;

//Enable SMTP debugging. 
$mail->SMTPDebug = 1;                               
//Set PHPMailer to use SMTP.
$mail->isSMTP();            
//Set SMTP host name                          
$mail->Host = "smtp.gmail.com";
//Set this to true if SMTP host requires authentication to send email
$mail->SMTPAuth = true;                          
//Provide username and password     
$mail->Username = "talatishubham04@gmail.com";                 
$mail->Password = "Shubham@2001";                           
//If SMTP requires TLS encryption then set it
$mail->SMTPSecure = "tls";                           
//Set TCP port to connect to 
$mail->Port = 587;                                   

//$mail->From = "@gmail.com";
$mail->FromName = "The Watch Shop";

$mail->addAddress($to);

$mail->isHTML(true);

$mail->Subject = $subject;
$mail->Body = $message;
$mail->AltBody = "This is the plain text version of the email content";

if(!$mail->send()) 
{
     echo "Mailer Error: " . $mail->ErrorInfo;
	 return false;
} 
else 
{
	
    return true;
}
}

?>