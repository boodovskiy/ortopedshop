<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-price-slider" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if (isset($error['error_warning'])) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error['error_warning']; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php }
        ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-price-slider" class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_status; ?></label>
				<div class="col-sm-10">
					<select name="customizepricefilter_status" class="form-control">
						<?php if ($customizepricefilter_status) { ?>
						<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
						<option value="0"><?php echo $text_disabled; ?></option>
						<?php } else { ?>
						<option value="1"><?php echo $text_enabled; ?></option>
						<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
						<?php } ?>
					</select>
				</div>
			</div>	
			
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_default_theme; ?></label>
				<div class="col-sm-10">
					<select name="customizepricefilter_theme" class="form-control">
						<?php if ($customizepricefilter_theme) { ?>
						<option value="1" selected="selected"><?php echo $text_yes; ?></option>
						<option value="0"><?php echo $text_no; ?></option>
						<?php } else { ?>
						<option value="1"><?php echo $text_yes; ?></option>
						<option value="0" selected="selected"><?php echo $text_no; ?></option>
						<?php } ?>
					</select>
				</div>
			</div>	
			
            <div class="form-group">
				<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_sort_order; ?></label>
				<div class="col-sm-10">
					<input type="number" min=0 name="customizepricefilter_sort_order" value="<?php echo $customizepricefilter_sort_order; ?>" size="3" class="form-control"/>
				</div>
			</div>	
            <div class="form-group">
				<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_lower_limit; ?></label>
				<div class="col-sm-10">
					<input type="text" name="customizepricefilter_lowerlimit" value="<?php echo $customizepricefilter_lowerlimit;?>" size="3" class="form-control"/>
				</div>
			</div>
				
            <div class="form-group">
				<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_upper_limit; ?></label>
				<div class="col-sm-10">
					<input type="text" name="customizepricefilter_upperlimit" value="<?php echo $customizepricefilter_upperlimit;?>" size="3" class="form-control"/>
				</div>
			</div>	
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_orientation; ?></label>
				<div class="col-sm-10">
				<select name="customizepricefilter_orientation" class="form-control">
						<?php if ($customizepricefilter_orientation=='horizontal') { ?>
						<option value="horizontal" selected="selected">Horizontal</option>
						<option value="vertical">Vertical</option>
						<?php } else { ?>
						<option value="horizontal">Horizontal</option>
						<option value="vertical" selected="selected">Vertical</option>
						<?php } ?>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_direction; ?></label>
				<div class="col-sm-10">
				<select name="customizepricefilter_direction" class="form-control">
						<?php if ($customizepricefilter_direction=='ltr') { ?>
						<option value="ltr" selected="selected">Left to Right</option>
						<option value="rtl">Right to left</option>
						<?php } else { ?>
						<option value="ltr">Left to Right</option>
						<option value="rtl" selected="selected">Right to left</option>
						<?php } ?>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_step; ?></label>
				<div class="col-sm-10">
					<input type="text" name="customizepricefilter_step" value="<?php echo $customizepricefilter_step;?>" size="3" class="form-control"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_margin; ?></label>
				<div class="col-sm-10">
					<input type="text" name="customizepricefilter_margin" value="<?php echo $customizepricefilter_margin;?>" size="3" class="form-control"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_button_color; ?></label>
				<div class="col-sm-10">
					<input type="text" name="customizepricefilter_button_color" value="<?php echo $customizepricefilter_button_color;?>" size="3" class="form-control"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_filled_color; ?></label>
				<div class="col-sm-10">
					<input type="text" name="customizepricefilter_filled_color" value="<?php echo $customizepricefilter_filled_color;?>" size="3" class="form-control"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_slider_thickness; ?></label>
				<div class="col-sm-10">
					<input type="text" name="customizepricefilter_thickness" value="<?php echo $customizepricefilter_thickness;?>" size="3" class="form-control"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_reset_button; ?></label>
				<div class="col-sm-10">
					<input type="checkbox" name="customizepricefilter_reset_button" value='show' <?php echo $checked;?> size="3" class="form-control"/>
				</div>
			</div>
           </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?> 
