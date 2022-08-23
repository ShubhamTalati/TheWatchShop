<?php
    $login = false;
    $error = false;
if($_SERVER["REQUEST_METHOD"] == "POST"){
    include 'admin/connection.inc.php';
    $username = $_POST["username"];
    $password = $_POST["password"];
    
        //$sql="SELECT * FROM `users` where `username`='$username' AND `password`='$password'";

        //for security hase code
        $sql="SELECT * FROM `users` where `username`='$username'";
        $result = mysqli_query($con, $sql);
        $num= mysqli_num_rows($result);
        if($num==1){
          while($row=mysqli_fetch_assoc($result)){
            
            if(password_verify($password,$row['password'])){

              $login=true;
              
              session_start();
              $_SESSION['loggedin']= true;
              $_SESSION['username']= $username;
              header("location: index.php");
            }
            else{

              $error = "password invalid !";
          }

        }
      }
    
        else{

            $error = "invalid !";
        }
    }

?>

<?php
if($login){
  
echo '<div class="alert alert-success">
<strong>Success!</strong> You are logged in!
</div>';
}
if($error){

echo '<div class="alert alert-danger">
  <strong>Error!</strong> '.$error.'
  </div>';
}
?>
<?php require 'header.php'?>


<?php require 'linkscript.php'?>

	<!--start-breadcrumbs-->
	<div class="breadcrumbs">
		<div class="container">
			<div class="breadcrumbs-main">
				<ol class="breadcrumb">
					<li><a href="index.php">Home</a></li>
					<li class="active">Account</li>
				</ol>
			</div>
		</div>
	</div>



	
	<?php
if($login){
    echo '<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong>success!</strong> You are logged in!
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>';
}
if($error){
    echo '<div class="alert alert-danger alert-dismissible fade show" role="alert">
  <strong>error!</strong> '.$error.'
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>';
}
?>



	</br></br>
	<div class="container my-4">
<h1 class="text-center" >  login to our website  </h1>


</br></br>
<form action="account.php" method="post" >
  <div class="form-group col-md-6">
    <label for="username" style="font-size:14px">username <span style="color:red">*</span></label>
    <input type="text" class="form-control" id="username" name="username" required>
    </div>
 
  <div class="form-group col-md-6" >
    <label for="password" style="font-size:14px">password <span style="color:red">*</span></label>
    <input type="password" class="form-control" id="password" name="password" required>
    </div>
 
  
</br></br></br></br></br></br>
  <button type="submit" class="text-center btn btn-primary col-md-3 " style="font-size:14px">Submit</button>
  </br>
  
<a class="forgot" style="font-size:14px" href="#">Forgot Your Password?</a>
 
						
</form>

</br></br></br></br></br></br>
<div class="col-md-6 account-right account-left">
					<h3>New User? Create an Account</h3>
					<p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
					<a href="register.php">Create an Account</a>
				</div>
</div>

</br></br></br></br>
	<!--end-breadcrumbs-->
	<!--account-starts
	<div class="account">
		<div class="container">
		<div class="account-top heading">
				<h2>ACCOUNT</h2>
			</div>
			<div class="account-main">
				<div class="col-md-6 account-left">
					<h3>Existing User</h3>
					<div class="account-bottom">
						<input placeholder="username" type="text" tabindex="3" required>
						<input placeholder="password" type="password" tabindex="4" required>
						<div class="address">
							<a class="forgot" href="#">Forgot Your Password?</a>
							<input type="submit" value="Login">
						</div>
					</div>
				</div>
				<div class="col-md-6 account-right account-left">
					<h3>New User? Create an Account</h3>
					<p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
					<a href="register.php">Create an Account</a>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>-->
	<!--account-end-->
	
	<?php require 'footer.php'?>