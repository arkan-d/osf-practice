
<section id="title" class="emerald">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
               <h1>Users activity</h1>
	       
	       <table class="table table-bordered">
	<tr>
		<th>Email</th>
		<th>Last login</th>		
		<th>Created on</th>
	</tr>
	
	<tr>
            <td><?=$email;?></td>
            <td><?=$last_login;?></td>            
            <td><?=$created_on;?></td>
            
            
	</tr>
	
</table>
                </div>
                
            </div>
        </div>
    </section><!--/#title-->


<div class="container"  style="padding-top:50px;">
	<div class="row">
		<div class="col-lg-12">
			


<p><?php if (isset($message) && !empty($message))
{ echo "<div class='col-md-12 alert alert-warning' role='alert'>{$message}</div>";}?> </p>

<div class="container">
    <div class="col-md-6">

    </div>
</div>

<? if (isset($todo) && !empty($todo)) {?>
<div class="container">
    <div class="col-md-12">
<table class="table table-striped table-border table-hover ">
	<tr>
		<th>Date/time</th>
		<th>Client Browser</th>
                <th>IP adress</th>	
		<th>Page</th>
	</tr>
	
        
	
            
            <? 
            foreach ($todo as $keay => $value) { 
            ?>
            <tr>
            <td><?=$value['date_time'];?></td>
            <td><?=$value['client_user_agent'];?></td>
            <td><?=$value['client_ip'];?></td>
            <td><?=$value['referer_page'];?></td>
            </tr>
            <? } ?>
            
	
	
</table>
</div>
</div> <? } ?>

		</div>
	</div>
</div>