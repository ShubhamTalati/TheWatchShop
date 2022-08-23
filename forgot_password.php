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
<?php
require_once("connection.inc.php");
require_once("forgot_password_submit.php");
include('PHPMailer/PHPMailerAutoload.php');

if ($_SERVER["REQUEST_METHOD"]=="POST") {
	
	if(isset($_POST['username']) && !empty($_POST['username']))
	{
		$username = mysqli_real_escape_string($con,$_POST['username']);
		
		echo $query = "select * from users where email = '".$username."'";
	
		$result = mysqli_query($con, $query);
		$arr = array();
		if (mysqli_num_rows($result) == 1) {
			
			
			$row1=mysqli_fetch_array($result);
			
				$message = "<h3>Your password is   : " . $row1['password'] . "</h3>";
				$subject = "Password";		
				$mailSent = send_mail($username, $message, $subject);
				if ($mailSent) {
					session_start();
					$_SESSION['id'] = $id;
					echo "<script>
								window.location='login.php';
					      </script>";
				} else {
					
				}
				$array = array('status' => '200' ,'details' => $arr);

		}	else {
			echo "error1"; die;
		}
		
	} else {
		echo "asdasasdad"; die;
	}	 
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
                                  <a class="breadcrumb-item" href="index.php" style="color:white">Home</a>
                                  <span class="brd-separetor" style="color:white"><i class="zmdi zmdi-chevron-right"></i></span>
                                  <span class="breadcrumb-item active" style="color:white">Forgot Password</span>
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
									<h2 class="title__line--6">Forgot Password</h2>
								</div>
							</div>
							<div class="col-xs-12">
								<form id="login-form" method="post">
									<div class="single-contact-form">
										<div class="contact-box name">
											<input type="text" name="username" id="email" placeholder="Your Email*" style="width:100%">
										</div>
										<span class="field_error" id="email_error"></span>
									</div>
									
									<div class="contact-btn">
										<button type="submit" class="fv-btn"  id="btn_submit">Submit</button>
										<!-- onclick="forgot_password()" -->
									</div>
								</form>
								<div class="form-output login_msg">
									<p class="form-messege field_error"></p>
								</div>
							</div>
						</div> 
                
				</div>
				

					
            </div>
        </section>
		<script>
		function forgot_password(){
			jQuery('#email_error').html('');
			var email=jQuery('#email').val();
			if(email==''){
				jQuery('#email_error').html('Please enter email id');
			}else{
				jQuery('#btn_submit').html('Please wait...');
				jQuery('#btn_submit').attr('disabled',true);
				jQuery.ajax({
					url:'forgot_password_submit.php',
					type:'post',
					data:'email='+email,
					success:function(result){
						jQuery('#email').val('');
						jQuery('#email_error').html(result);
						jQuery('#btn_submit').html('Submit');
						jQuery('#btn_submit').attr('disabled',false);
					}
				})
			}
		}
		</script>
<?php require('footer.php')?>        