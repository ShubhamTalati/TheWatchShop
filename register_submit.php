<?php
require('connection.inc.php');
require('functions.inc.php');

$name = $_POST["name"];
 $email = $_POST["email"];
 $mobile = $_POST["mobile"];
 $address = $_POST["address"];
 $city = $_POST["city"];
 $pincode = $_POST["pincode"];
 $password = $_POST["password"];

// $name=get_safe_value($con,$_POST['name']);
// $email=get_safe_value($con,$_POST['email']);
// $mobile=get_safe_value($con,$_POST['mobile']);
// $address=get_safe_value($con,$_POST['address']);
// $city=get_safe_value($con,$_POST['city']);
// $pincode=get_safe_value($con,$_POST['pincode']);
// $password=get_safe_value($con,$_POST['password']);

$check_user=mysqli_num_rows(mysqli_query($con,"select * from users where email='$email'"));
$check_mobile=mysqli_num_rows(mysqli_query($con,"select * from users where mobile='$mobile'"));
if($check_user>0){
	echo "email_present";
}elseif($check_mobile>0){
	echo "mobile_present";
}else{
	$added_on=date('Y-m-d h:i:s');
	
	
	mysqli_query($con,"INSERT INTO `users` (`name`, `password`,`email`, `mobile`,`address`, `city`,`pincode`, `added_on`) VALUES ('$name', '$password','$email', '$mobile','$address', '$city','$pincode', current_timestamp())
	");
	
	//mysqli_query($con,"insert into users(name,email,mobile,address,city,pincode,password,added_on) values('$name','$email','$mobile','$address','$city','$pincode','$password','$added_on')");
	echo "insert";
}
?>