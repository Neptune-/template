<!-- BEGIN html_validation -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
<table>
	<tr>
		<td>
			<div>
				<div>
					<div>
<!-- END html_validation -->
					</div>
				</div>
				<!-- BEGIN switch_footer_links -->
				<div align="center">
					<div class="gen">
						<!-- BEGIN footer_link -->
							<!-- BEGIN switch_separator -->&nbsp;|&nbsp;<!-- END switch_separator -->
							<a name="bottom" class="copyright" href="{switch_footer_links.footer_link.U_FOOTER_LINK_HREF}" rel="{switch_footer_links.footer_link.FOOTER_LINK_REL}" target="{switch_footer_links.footer_link.FOOTER_LINK_TARGET}" title="{switch_footer_links.footer_link.L_FOOTER_LINK_TITLE}">{switch_footer_links.footer_link.L_FOOTER_LINK_TEXT}</a>
						<!-- END footer_link -->
					</div>
				</div>
				<!-- END switch_footer_links -->
			</div>
			{PROTECT_FOOTER}
		</td>
	</tr>
</table>

<!-- BEGIN switch_facebook_login -->
<div id="fb-root"></div>
<script type="text/javascript">
//<![CDATA[
FB.init({appId: '{switch_facebook_login.FACEBOOK_APP_ID}', status: true, cookie: true, xfbml: true, oauth: true});
//]]>
</script>
<!-- END switch_facebook_login -->

<!-- BEGIN switch_facebook_logout_TMP -->
<script type="text/javascript">
//<![CDATA[
FB.Event.subscribe('auth.logout', function(response) {
	if ($('a#logout'))
	{
		var lien_redir = $('a#logout').attr('href');

		if ($('a#logout').attr('href') && $('a#logout').attr('href') != '')
		{
			document.location.href = 'http://{switch_facebook_logout.SERVER_NAME}/' + lien_redir;
		}
	}
});

$(document).ready( function() {
	$('a#logout').click( function() {
		FB.logout();
	} );
});
//]]>
</script>
<!-- END switch_facebook_logout_TMP -->

<script type="text/javascript">
//<![CDATA[
	fa_endpage();
//]]>
</script>

</body>
</html>