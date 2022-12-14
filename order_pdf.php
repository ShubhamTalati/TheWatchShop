<?php
include('vendor/autoload.php');
require('connection.inc.php');
require('functions.inc.php');

if(!$_SESSION['ADMIN_LOGIN']){
	if(!isset($_SESSION['USER_ID'])){
		die();
	}
}

$order_id=get_safe_value($con,$_GET['id']);

$coupon_details=mysqli_fetch_assoc(mysqli_query($con,"select coupon_value from `order` where id='$order_id'"));
$coupon_value=$coupon_details['coupon_value'];

$css=file_get_contents('css/bootstrap.min.css');
$css.=file_get_contents('style.css');

$html='<hr><h1 align="center"> The Watch Shop </h1><hr>
						
<table class="email-wrapper" width="100%" cellpadding="0" cellspacing="0" role="presentation">
  <tr>
	<td align="center">
	  <table class="email-content" width="100%" cellpadding="0" cellspacing="0" role="presentation">
	
		<!-- Email Body -->
		<tr>
		  <td class="email-body" width="100%" cellpadding="0" cellspacing="0">
			<table class="email-body_inner" align="center" width="570" cellpadding="0" cellspacing="0" role="presentation">
			  <!-- Body content -->
			  <tr>
				<td class="content-cell">
				  <div class="f-fallback">
				
					<br>
					<p>Thanks for using The Watch Shop. This is an invoice for your recent purchase.</p>
					
					<p>If you have any questions about this invoice, simply reply to this email or reach out to our support team for help.</p>
					<p>Cheers,
					  <br>The Watch Shop Team</p>
					<!-- Sub copy -->
					
				  </div>
				</td>
			  </tr>
			</table>
		  </td>
		</tr>
	
	  </table>
	</td>
  </tr>
</table>

<br><br>

<div class="wishlist-table table-responsive">
   <table>
      <thead>
         <tr>
            <th class="product-thumbnail">Product Name</th>
            <th class="product-thumbnail">Product Image</th>
            <th class="product-name">Qty</th>
            <th class="product-price">Price</th>
            <th class="product-price">Total Price</th>
         </tr>
      </thead>
      <tbody>';
		
		if(isset($_SESSION['ADMIN_LOGIN'])){
			$res=mysqli_query($con,"select distinct(order_detail.id) ,order_detail.*,product.name,product.image from order_detail,product ,`order` where order_detail.order_id='$order_id' and order_detail.product_id=product.id");
		}else{
			$uid=$_SESSION['USER_ID'];
			$res=mysqli_query($con,"select distinct(order_detail.id) ,order_detail.*,product.name,product.image from order_detail,product ,`order` where order_detail.order_id='$order_id' and `order`.user_id='$uid' and order_detail.product_id=product.id");
		}
		
		$total_price=0;
		if(mysqli_num_rows($res)==0){
			die();
		}
		while($row=mysqli_fetch_assoc($res)){
		$total_price=$total_price+($row['qty']*$row['price']);
		 $pp=$row['qty']*$row['price'];
         $html.='<tr>
            <td class="product-name">'.$row['name'].'</td>
            <td class="product-name"> <img src="'.PRODUCT_IMAGE_SITE_PATH.$row['image'].'"></td>
            <td class="product-name">'.$row['qty'].'</td>
            <td class="product-name">'.$row['price'].'</td>
            <td class="product-name">'.$pp.'</td>
         </tr>';
		 }
		 
		if($coupon_value!=''){								
			$html.='<tr>
				<td colspan="3"></td>
				<td class="product-name">Coupon Value</td>
				<td class="product-name">'.$coupon_value.'</td>
				
			</tr>';
		}
		 
		 $total_price=$total_price-$coupon_value;
		 $html.='<tr>
				<td colspan="3"></td>
				<td class="product-name">Total Price</td>
				<td class="product-name">'.$total_price.'</td>
				
			</tr>';
		 
      $html.='</tbody>
   </table>
</div>
<br><br>
<hr>
<br>
  <table class="email-footer" align="center" width="570" cellpadding="0" cellspacing="0" role="presentation">
	<tr>
	  <td class="content-cell" align="center">
		<p class="f-fallback sub align-center">&copy; 2021 All rights reserved.</p>
		<p class="f-fallback sub align-center"><br>
		  [The Watch Shop, LLC]<br>
		  Shubham watch services, Main Shopping Center, Sector-7,  Gandhinagar, Gujarat<br>
		  +91 8154916027
		</p>
	  </td>
	</tr>
  </table>
';
$mpdf=new \Mpdf\Mpdf();
$mpdf->WriteHTML($css,1);
$mpdf->WriteHTML($html,2);
$file=time().'.pdf';
$mpdf->Output($file,'D');
?>
		<style type="text/css" rel="stylesheet" media="all">
								@import url("https://fonts.googleapis.com/css?family=Nunito+Sans:400,700&display=swap");
								body {
								width: 100% !important;
								height: 100%;
								margin: 0;
								-webkit-text-size-adjust: none;
								}

								a {
								color: #3869D4;
								}

								a img {
								border: none;
								}

								td {
								word-break: break-word;
								}

								.preheader {
								display: none !important;
								visibility: hidden;
								mso-hide: all;
								font-size: 1px;
								line-height: 1px;
								max-height: 0;
								max-width: 0;
								opacity: 0;
								overflow: hidden;
								}
								/* Type ------------------------------ */

								body,
								td,
								th {
								font-family: "Nunito Sans", Helvetica, Arial, sans-serif;
								}

								h1 {
								margin-top: 0;
								color: #333333;
								font-size: 22px;
								font-weight: bold;
								text-align: left;
								}

								h2 {
								margin-top: 0;
								color: #333333;
								font-size: 16px;
								font-weight: bold;
								text-align: left;
								}

								h3 {
								margin-top: 0;
								color: #333333;
								font-size: 14px;
								font-weight: bold;
								text-align: left;
								}

								td,
								th {
								font-size: 16px;
								}

								p,
								ul,
								ol,
								blockquote {
								margin: .4em 0 1.1875em;
								font-size: 16px;
								line-height: 1.625;
								}

								p.sub {
								font-size: 13px;
								}
								/* Utilities ------------------------------ */

								.align-right {
								text-align: right;
								}

								.align-left {
								text-align: left;
								}

								.align-center {
								text-align: center;
								}
								/* Buttons ------------------------------ */

								.button {
								background-color: #3869D4;
								border-top: 10px solid #3869D4;
								border-right: 18px solid #3869D4;
								border-bottom: 10px solid #3869D4;
								border-left: 18px solid #3869D4;
								display: inline-block;
								color: #FFF;
								text-decoration: none;
								border-radius: 3px;
								box-shadow: 0 2px 3px rgba(0, 0, 0, 0.16);
								-webkit-text-size-adjust: none;
								box-sizing: border-box;
								}

								.button--green {
								background-color: #22BC66;
								border-top: 10px solid #22BC66;
								border-right: 18px solid #22BC66;
								border-bottom: 10px solid #22BC66;
								border-left: 18px solid #22BC66;
								}

								.button--red {
								background-color: #FF6136;
								border-top: 10px solid #FF6136;
								border-right: 18px solid #FF6136;
								border-bottom: 10px solid #FF6136;
								border-left: 18px solid #FF6136;
								}

								@media only screen and (max-width: 500px) {
								.button {
									width: 100% !important;
									text-align: center !important;
								}
								}
								/* Attribute list ------------------------------ */

								.attributes {
								margin: 0 0 21px;
								}

								.attributes_content {
								background-color: #F4F4F7;
								padding: 16px;
								}

								.attributes_item {
								padding: 0;
								}
								/* Related Items ------------------------------ */

								.related {
								width: 100%;
								margin: 0;
								padding: 25px 0 0 0;
								-premailer-width: 100%;
								-premailer-cellpadding: 0;
								-premailer-cellspacing: 0;
								}

								.related_item {
								padding: 10px 0;
								color: #CBCCCF;
								font-size: 15px;
								line-height: 18px;
								}

								.related_item-title {
								display: block;
								margin: .5em 0 0;
								}

								.related_item-thumb {
								display: block;
								padding-bottom: 10px;
								}

								.related_heading {
								border-top: 1px solid #CBCCCF;
								text-align: center;
								padding: 25px 0 10px;
								}
								/* Discount Code ------------------------------ */

								.discount {
								width: 100%;
								margin: 0;
								padding: 24px;
								-premailer-width: 100%;
								-premailer-cellpadding: 0;
								-premailer-cellspacing: 0;
								background-color: #F4F4F7;
								border: 2px dashed #CBCCCF;
								}

								.discount_heading {
								text-align: center;
								}

								.discount_body {
								text-align: center;
								font-size: 15px;
								}
								/* Social Icons ------------------------------ */

								.social {
								width: auto;
								}

								.social td {
								padding: 0;
								width: auto;
								}

								.social_icon {
								height: 20px;
								margin: 0 8px 10px 8px;
								padding: 0;
								}
								/* Data table ------------------------------ */

								.purchase {
								width: 100%;
								margin: 0;
								padding: 35px 0;
								-premailer-width: 100%;
								-premailer-cellpadding: 0;
								-premailer-cellspacing: 0;
								}

								.purchase_content {
								width: 100%;
								margin: 0;
								padding: 25px 0 0 0;
								-premailer-width: 100%;
								-premailer-cellpadding: 0;
								-premailer-cellspacing: 0;
								}

								.purchase_item {
								padding: 10px 0;
								color: #51545E;
								font-size: 15px;
								line-height: 18px;
								}

								.purchase_heading {
								padding-bottom: 8px;
								border-bottom: 1px solid #EAEAEC;
								}

								.purchase_heading p {
								margin: 0;
								color: #85878E;
								font-size: 12px;
								}

								.purchase_footer {
								padding-top: 15px;
								border-top: 1px solid #EAEAEC;
								}

								.purchase_total {
								margin: 0;
								text-align: right;
								font-weight: bold;
								color: #333333;
								}

								.purchase_total--label {
								padding: 0 15px 0 0;
								}

								body {
								background-color: #F4F4F7;
								color: #51545E;
								}

								p {
								color: #51545E;
								}

								p.sub {
								color: #6B6E76;
								}

								.email-wrapper {
								width: 100%;
								margin: 0;
								padding: 0;
								-premailer-width: 100%;
								-premailer-cellpadding: 0;
								-premailer-cellspacing: 0;
								background-color: #F4F4F7;
								}

								.email-content {
								width: 100%;
								margin: 0;
								padding: 0;
								-premailer-width: 100%;
								-premailer-cellpadding: 0;
								-premailer-cellspacing: 0;
								}
								/* Masthead ----------------------- */

								.email-masthead {
								padding: 25px 0;
								text-align: center;
								}

								.email-masthead_logo {
								width: 94px;
								}

								.email-masthead_name {
								font-size: 16px;
								font-weight: bold;
								color: #A8AAAF;
								text-decoration: none;
								text-shadow: 0 1px 0 white;
								}
								/* Body ------------------------------ */

								.email-body {
								width: 100%;
								margin: 0;
								padding: 0;
								-premailer-width: 100%;
								-premailer-cellpadding: 0;
								-premailer-cellspacing: 0;
								background-color: #FFFFFF;
								}

								.email-body_inner {
								width: 570px;
								margin: 0 auto;
								padding: 0;
								-premailer-width: 570px;
								-premailer-cellpadding: 0;
								-premailer-cellspacing: 0;
								background-color: #FFFFFF;
								}

								.email-footer {
								width: 570px;
								margin: 0 auto;
								padding: 0;
								-premailer-width: 570px;
								-premailer-cellpadding: 0;
								-premailer-cellspacing: 0;
								text-align: center;
								}

								.email-footer p {
								color: #6B6E76;
								}

								.body-action {
								width: 100%;
								margin: 30px auto;
								padding: 0;
								-premailer-width: 100%;
								-premailer-cellpadding: 0;
								-premailer-cellspacing: 0;
								text-align: center;
								}

								.body-sub {
								margin-top: 25px;
								padding-top: 25px;
								border-top: 1px solid #EAEAEC;
								}

								.content-cell {
								padding: 35px;
								}
								/*Media Queries ------------------------------ */

								@media only screen and (max-width: 600px) {
								.email-body_inner,
								.email-footer {
									width: 100% !important;
								}
								}

								@media (prefers-color-scheme: dark) {
								body,
								.email-body,
								.email-body_inner,
								.email-content,
								.email-wrapper,
								.email-masthead,
								.email-footer {
									background-color: #333333 !important;
									color: #FFF !important;
								}
								p,
								ul,
								ol,
								blockquote,
								h1,
								h2,
								h3 {
									color: #FFF !important;
								}
								.attributes_content,
								.discount {
									background-color: #222 !important;
								}
								.email-masthead_name {
									text-shadow: none !important;
								}
								}
								</style>