    <?php 
//index.php
$con= mysqli_connect("localhost", "root", "", "ecom");
$res=mysqli_query($con,"select `order`.*,order_status.name as order_status_str from `order`,order_status where order_status.id=`order`.order_status order by `order`.id desc");
$chart_data = '';
while($row = mysqli_fetch_array($res))
{
 $chart_data .= "{order_id:".$row["id"].", total_price:".$row["total_price"]."}, ";
}
$chart_data = substr($chart_data, 0, -2);
?>


  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
  
  <section class="content">
      <div class="container-fluid" style="padding-left:160px">
  <br /><br />
  <div class="container" style="width:900px;">
   <h3 align="center">Last month Sale Data</h3>   
   <br /><br />
   <div id="chart"></div>
  </div>

  </div>
  </section>


<script>
Morris.Bar({
 element : 'chart',
 data:[<?php echo $chart_data; ?>],
 xkey:'order_id',
 ykeys:['total_price'],
 labels:['total_price'],
 hideHover:'auto',
 stacked:true
});
</script>
 

