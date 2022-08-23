<?php 
require('top.php');


if(isset($_SESSION['USER_LOGIN']) && $_SESSION['USER_LOGIN']=='yes'){
	?>
	<script>
	window.location.href='my_order.php';
	</script>
	<?php
}
?>

<!-- Start Bradcaump area -->
        <div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(images/bg/banner-1_1200x360.jpg) no-repeat scroll center center / cover ;">
            <div class="ht__bradcaump__wrap">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="bradcaump__inner">
                                <nav class="bradcaump-inner">
                                  <a class="breadcrumb-item" href="index.php"  style="color:white">Home</a>
                                  <span class="brd-separetor"  style="color:white"><i class="zmdi zmdi-chevron-right"></i></span>
                                  <span class="breadcrumb-item active"  style="color:white">Login/Register</span>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->
        
		<!-- Start Contact Area -->
        <section class="htc__contact__area ptb--100 bg__white">
            <div class="container">
                <div class="row">
					<div class="col-md-6">
						<div class="contact-form-wrap mt--60">
							<div class="col-xs-12">
								<div class="contact-title">
									<h2 class="title__line--6">Login</h2>
								</div>
							</div>
							<div class="col-xs-12">
								<form id="login-form" method="post">
									<div class="single-contact-form">
										<div class="contact-box name">
											<input type="text" name="login_email" id="login_email" placeholder="Your Email*" style="width:100%">
										</div>
										<span class="field_error" id="login_email_error"></span>
									</div>
							
									<div class="single-contact-form">
										<div class="contact-box name">
											<input type="password" name="login_password" id="login_password" placeholder="Your Password*" style="width:100%">
										</div>
										<span class="field_error" id="login_password_error"></span>
									</div>
									
									<div class="contact-btn">
										<button type="button" class="fv-btn" onclick="user_login()">Login</button>
										<a href="forgot_password.php" class="forgot_password">Forgot Password</a>
									</div>
									<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
								</form>
								<div class="form-output login_msg">
									<p class="form-messege field_error"></p>
								</div>
							</div>
						</div> 
						
				</div>
				

					<div class="col-md-6">
						<div class="contact-form-wrap mt--60">
							<div class="col-xs-12">
								<div class="contact-title">
									<h2 class="title__line--6">Register</h2>
								</div>
							</div>
							
						</div> 
                
					</div>
					


						
<?php
 $showalert = false;
 $showerror = false;
if($_SERVER["REQUEST_METHOD"]=="POST"){
 
 $name = $_POST["name"];
 $email = $_POST["email"];
 $mobile = $_POST["mobile"];
 $address = $_POST["address"];
 $city = $_POST["city"];
 $pincode = $_POST["pincode"];
 $password = $_POST["password"];

 $existSql="Select * from `users` where name='$name'";
 $result=mysqli_query($con, $existSql);
 $numExistRows=mysqli_num_rows($result);
 if($numExistRows >0){
   //$Exist=true;
   $showerror = "user name all ready exists... plz try again!";

 }

 else{
	// $Exist= false;
   
		   $sql="INSERT INTO `users` (`name`, `password`,`email`, `mobile`,`address`, `city`,`pincode`, `added_on`) VALUES ('$name', '$password','$email', '$mobile','$address', '$city','$pincode', current_timestamp())";
		   $result = mysqli_query($con, $sql);
   
		   if($result){
			   $showalert = true;
		   }
	   
		   else{
			   $showerror = "password does not match";
		   }
   }
   }
   
?>
<?php
if($showalert){
 echo "<span style='color:green'><script type='text/javascript'>alert('Successfully! your have been created account');</script></span>";
}
if($showerror){
  
echo "<span style='color:red'><script type='text/javascript'>alert('Error! Invalid password or username');</script></span>";

}
?>
 <div class="container my-4">
<form action="login.php" method="post">
  <div class="form-group col-md-6">
  <div class="single-contact-form">
	<div class="contact-box name">
    <input type="text" maxlength="11" class="form-control" id="name" name="name" placeholder="Your name*" style="width:100%" required>
  </div>
  </div>
  </div>
  <div class="form-group col-md-6">
  <div class="single-contact-form">
	<div class="contact-box name">
    <input type="text" maxlength="25" class="form-control" id="email" name="email" placeholder="Your email*" style="width:100%" required>
  </div>
  </div>
  </div>
  <div class="form-group col-md-6">
  <div class="single-contact-form">
	<div class="contact-box name">
    <input type="text" maxlength="10" class="form-control" id="mobile" name="mobile" placeholder="Your mobile*" style="width:100%" required>
  </div>
  </div>
  </div>
  <div class="form-group col-md-6">
  <div class="single-contact-form">
	<div class="contact-box name">
    <input type="text" maxlength="200" class="form-control" id="address" name="address" placeholder="Your address*" style="width:100%" required>
  </div>
  </div>
  </div>
  <div class="form-group col-md-6">
  <div class="single-contact-form">
	<div class="contact-box name">
    <input type="text" maxlength="15" class="form-control" id="city" name="city" placeholder="Your city*" style="width:100%" required>
  </div>
  </div>
  </div>
  <div class="form-group col-md-6">
  <div class="single-contact-form">
	<div class="contact-box name">
    <input type="text" maxlength="6" class="form-control" id="pincode" name="pincode" placeholder="Your pincode*" style="width:100%" required>
  </div>
  </div>
  </div>
  <div class="form-group col-md-6">
  <div class="single-contact-form">
	<div class="contact-box name">
    <input type="password" maxlength="11"  class="form-control" id="password" name="password" placeholder="Your password*" style="width:100%" required>
  </div>
</div>
</div>

  <button type="submit" class="fv-btn ">Submit</button>
</form>

</div>



</div>
        </section>














		<input type="hidden" id="is_email_verified"/>
		<input type="hidden" id="is_mobile_verified"/>
		<script>
		function email_sent_otp(){
			jQuery('#email_error').html('');
			var email=jQuery('#email').val();
			if(email==''){
				jQuery('#email_error').html('Please enter email id');
			}else{
				jQuery('.email_sent_otp').html('Please wait..');
				jQuery('.email_sent_otp').attr('disabled',true);
				jQuery.ajax({
					url:'send_otp.php',
					type:'post',
					data:'email='+email+'&type=email',
					success:function(result){
						if(result=='done'){
							jQuery('#email').attr('disabled',true);
							jQuery('.email_verify_otp').show();
							jQuery('.email_sent_otp').hide();
							
						}else if(result=='email_present'){
							jQuery('.email_sent_otp').html('Send OTP');
							jQuery('.email_sent_otp').attr('disabled',false);
							jQuery('#email_error').html('Email id already exists');
						}else{
							jQuery('.email_sent_otp').html('Send OTP');
							jQuery('.email_sent_otp').attr('disabled',false);
							jQuery('#email_error').html('Please try after sometime');
						}
					}
				});
			}
		}
		function email_verify_otp(){
			jQuery('#email_error').html('');
			var email_otp=jQuery('#email_otp').val();
			if(email_otp==''){
				jQuery('#email_error').html('Please enter OTP');
			}else{
				jQuery.ajax({
					url:'check_otp.php',
					type:'post',
					data:'otp='+email_otp+'&type=email',
					success:function(result){
						if(result=='done'){
							jQuery('.email_verify_otp').hide();
							jQuery('#email_otp_result').html('Email id verified');
							jQuery('#is_email_verified').val('1');
							if(jQuery('#is_mobile_verified').val()==1){
								jQuery('#btn_register').attr('disabled',false);
							}
						}else{
							jQuery('#email_error').html('Please enter valid OTP');
						}
					}
					
				});
			}
		}
		
		function mobile_sent_otp(){
			jQuery('#mobile_error').html('');
			var mobile=jQuery('#mobile').val();
			if(mobile==''){
				jQuery('#mobile_error').html('Please enter mobile number');
			}else{
				jQuery('.mobile_sent_otp').html('Please wait..');
				jQuery('.mobile_sent_otp').attr('disabled',true);
				jQuery('.mobile_sent_otp');
				jQuery.ajax({
					url:'send_otp.php',
					type:'post',
					data:'mobile='+mobile+'&type=mobile',
					success:function(result){
						if(result=='done'){
							jQuery('#mobile').attr('disabled',true);
							jQuery('.mobile_verify_otp').show();
							jQuery('.mobile_sent_otp').hide();
						}else if(result=='mobile_present'){
							jQuery('.mobile_sent_otp').html('Send OTP');
							jQuery('.mobile_sent_otp').attr('disabled',false);
							jQuery('#mobile_error').html('Mobile number already exists');
						}else{
							jQuery('.mobile_sent_otp').html('Send OTP');
							jQuery('.mobile_sent_otp').attr('disabled',false);
							jQuery('#mobile_error').html('Please try after sometime');
						}
					}
				});
			}
		}
		function mobile_verify_otp(){
			jQuery('#mobile_error').html('');
			var mobile_otp=jQuery('#mobile_otp').val();
			if(mobile_otp==''){
				jQuery('#mobile_error').html('Please enter OTP');
			}else{
				jQuery.ajax({
					url:'check_otp.php',
					type:'post',
					data:'otp='+mobile_otp+'&type=mobile',
					success:function(result){
						if(result=='done'){
							jQuery('.mobile_verify_otp').hide();
							jQuery('#mobile_otp_result').html('Mobile number verified');
							jQuery('#is_mobile_verified').val('1');
							if(jQuery('#is_email_verified').val()==1){
								jQuery('#btn_register').attr('disabled',false);
							}
						}else{
							jQuery('#mobile_error').html('Please enter valid OTP');
						}
					}
					
				});
			}
		}
		</script>
<?php require('footer.php')?>        