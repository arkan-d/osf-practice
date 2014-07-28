<footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    &copy;  <?=date('Y')?> <a target="_blank" href="http://www.osf-global.com/" >
                    OSF Global Services </a>
                </div>
                <div class="col-sm-6">
                    <ul class="pull-right">
                        <li><a href="<?=base_url();?>auth/forgot_password">Restore password</a></li>
                        <li><a href="<?=base_url();?>auth/create_user" ><?php echo lang('login_registration');?></a></li>
                       
                        <li><a id="gototop" class="gototop" href="#"><i class="glyphicon glyphicon-chevron-up"></i></a></li><!--#gototop-->
                    </ul>
                </div>
            </div>
        </div>
    </footer><!--/#footer-->

    <script src="<?=base_url();?>js/jquery.js"></script>
    <script src="<?=base_url();?>js/bootstrap.min.js"></script>
    <script src="<?=base_url();?>js/jquery.prettyPhoto.js"></script>
    <script src="<?=base_url();?>js/main.js"></script>
</body>
</html>