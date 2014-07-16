<div class="container"  style="padding-top:50px;">
	<div class="row">
		<div class="col-lg-12">
			
<h1><?php echo lang('index_heading');?></h1>
<p><?php echo lang('index_subheading');?></p>

<p><?php if (isset($message) && !empty($message))
{ echo "<div class='col-md-12 alert alert-warning' role='alert'>{$message}</div>";}?> </p>

<table class="table table-striped table-border table-hover ">
	<tr>
		<th><?php echo lang('index_fname_th');?></th>
		<th><?php echo lang('index_lname_th');?></th>
		<th><?php echo lang('index_email_th');?></th>
		<th><?php echo lang('index_groups_th');?></th>
		<th><?php echo lang('index_status_th');?></th>
		<th><?php echo lang('index_action_th');?></th>
		<th><?php echo lang('index_delete_th');?></th>
		<th><?php echo lang('index_feeds_th');?></th>
	</tr>
	<?php foreach ($users as $user):?>
		<tr>
			<td><?php echo $user->first_name;?></td>
			<td><?php echo $user->last_name;?></td>
			<td><?php echo $user->email;?></td>
			<td>
				<?php foreach ($user->groups as $group):?>
					<?php echo anchor("auth/edit_group/".$group->id, $group->name) ;?><br />
                <?php endforeach?>
			</td>
			<td><?php echo ($user->active) ? anchor("auth/deactivate/".$user->id, lang('index_active_link')) : anchor("auth/activate/". $user->id, lang('index_inactive_link'));?></td>
			<td><?php echo anchor("auth/edit_user/".$user->id, "<span class='glyphicon glyphicon-edit'></span>") ;?></td>
			<td><?php echo anchor("auth/delete_user/".$user->id, "<span class='glyphicon glyphicon-trash'></span>",array ("onClick"=>"return confirm('Delete This account?')")) ;?></td>
			<td><?php echo anchor("examples/edit_feeds/".$user->id,'Edit Feeds') ;?></td>
			
			
		</tr>
	<?php endforeach;?>
</table>

<p><?php echo anchor('auth/create_user', lang('index_create_user_link'),"class='btn btn-default'")?></p>
		</div>
	</div>
</div>