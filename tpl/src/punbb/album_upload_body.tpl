{JS_MENU}
<!-- BEGIN switch_user_logged_in -->
<div id="pun-visit" class="clearfix">
	<ul>
			<li><a href="{U_SEARCH_NEW}">{L_SEARCH_NEW}</a></li>
			<li><a href="{U_SEARCH_SELF}">{L_SEARCH_SELF}</a></li>
	</ul>
	<p>{LOGGED_AS}. {LAST_VISIT_DATE}</p>
</div>
<!-- END switch_user_logged_in -->
<!-- BEGIN switch_user_logged_out -->
<div id="pun-visit">
	<p>{L_NOT_CONNECTED} {L_LOGIN_REGISTER}</p>
</div>
<!-- END switch_user_logged_out -->

<!-- BEGIN switch_nuffload_enabled -->
<script type="text/javascript">
<!--
var inpIndex = 0;

function addInput()
{
	if (inpIndex >= ({MAX_UPLOADS}-1)){return;}
	var section = document.getElementById('parah');
	var newInput = document.createElement('input');
	var newPara = document.createElement('p');
	inpIndex++;
	newInput.type = 'file';
	newInput.id = 'pic_file-' + inpIndex;
	newInput.name = 'pic_file-' + inpIndex;
	newInput.className='post';
	newInput.size = '60';
	newPara.id = 'parah-' + inpIndex;
	newPara.style.margin = '0px';
	newPara.style.padding = '0px';
	section.appendChild(newPara);
	newPara.appendChild(newInput);

	if (document.getElementById('parat'))
	{
		var section = document.getElementById('parat');
		var newInput = document.createElement('input');
		var newPara = document.createElement('p');
		newInput.type = 'file';
		newInput.id = 'pic_thumbnail-' + inpIndex;
		newInput.name = 'pic_thumbnail-' + inpIndex;
		newInput.className='post';
		newInput.size = '60';
		newPara.id = 'parat-' + inpIndex;
		newPara.style.margin = '0px';
		newPara.style.padding = '0px';
		section.appendChild(newPara);
		newPara.appendChild(newInput);
	}
}

function deleteInput()
{
	var section = document.getElementById('parah');
	var oldPara = document.getElementById('parah-' + inpIndex);
	section.removeChild(oldPara);
	if (document.getElementById('parat'))
	{
		var section = document.getElementById('parat');
		var oldPara = document.getElementById('parat-' + inpIndex);
		section.removeChild(oldPara);
	}
	inpIndex--;
}

function postIt()
{
	var formOK = true;
	var complete = true;
	for (var loop=0; loop < document.upload.elements.length; loop++)
	{
		if (document.upload.elements[loop].value == "" & document.upload.elements[loop].type == "file")
		{
			complete = false;
		}
	}

	if (complete == false)
	{
		alert("{L_UPLOAD_NO_FILE}");
		formOK = false;
	}
	else if (document.upload.pic_desc.value.length > {S_PIC_DESC_MAX_LENGTH})
	{
		alert("{L_DESC_TOO_LONG}");
		formOK = false;
	}

	if (formOK)
	{
		<!-- BEGIN switch_show_progress_bar -->
		win = window.open("{U_ALBUM_NUFFLOAD}", "Uploader", "width=150,height=460,left=" + ((screen.width - w) / 2) + ",top=" + ((screen.height - h) / 2) + ",scrollbars=0,resizable=0,menubar=0,status=0,toolbar=0");
		if ( (parseInt(navigator.appVersion) >= 4) && ( win != null ) )
		{
			win.window.focus();
		}
		<!-- END switch_show_progress_bar -->
	}
	return formOK;
}
//-->
</script>
<!-- END switch_nuffload_enabled -->

<!-- BEGIN switch_nuffload_disabled -->
<script type="text/javascript">
<!--
var gFileuploadCounter = 1;
var fileBrowseHTML = '<input type="file" name="pic_file[]" /><br />';
var fileThumbBrowseHTML = '<input type="file" name="pic_thumbnail[]" /><br />';

function checkAlbumForm()
{
	formErrors = false;
	if (gFileuploadCounter == 1)
	{
		if (document.upload.pic_title.value.length < 2)
		{
			formErrors = "{L_UPLOAD_NO_TITLE}";
		}
		else if (document.upload.pic_file.value.length < 2)
		{
			formErrors = "{L_UPLOAD_NO_FILE}";
		}
		else if (document.upload.pic_desc.value.length > {S_PIC_DESC_MAX_LENGTH})
		{
			formErrors = "{L_DESC_TOO_LONG}";
		}
		else
		{
			switch (document.upload.cat_id.value)
			{
				case '{S_ALBUM_ROOT_CATEGORY}':
				case '{S_ALBUM_JUMPBOX_SEPERATOR}':
				case '{S_ALBUM_JUMPBOX_USERS_GALLERY}':
				case '{S_ALBUM_JUMPBOX_PUBLIC_GALLERY}':
				formErrors = "{L_NO_VALID_CAT_SELECTED}";
				default:
			}
		}
	}
	if (formErrors)
	{
		alert(formErrors);
		return false;
	}
	else
	{
		return true;
	}
}

function AddFileField()
{
	if (gFileuploadCounter <= {S_MAX_FILE_UPLOADS} )
	{
		gFileuploadCounter++;
		if(document.all)
		{
			document.all.file_browse.innerHTML += fileBrowseHTML;
			if(document.all.file_thumb_browse)
			{
				document.all.file_thumb_browse.innerHTML += fileThumbBrowseHTML;
			}

			if ( gFileuploadCounter > {S_MAX_FILE_UPLOADS})
			{
				document.all.addbutton.style.visibility = 'hidden';
			}
			document.all.upload_file_row.height = 25*(gFileuploadCounter-2);
		}
		else
		{
			document.getElementById("file_browse").innerHTML += fileBrowseHTML;
			if(document.getElementById("file_thumb_browse"))
			{
				document.getElementById("file_thumb_browse").innerHTML += fileThumbBrowseHTML;
			}

			if ( gFileuploadCounter > {S_MAX_FILE_UPLOADS})
			{
				document.getElementById("addbutton").style.visibility = 'hidden';
			}
			document.getElementById("upload_file_row").height = 25*(gFileuploadCounter-2);
		}
	}
}

function RemoveFileField()
{

	if (gFileuploadCounter >= 2 )
	{
		if(document.all)
		{
			document.all.file_browse.innerHTML = '';
			if(document.getElementById("file_thumb_browse"))
			{
				document.all.file_thumb_browse.innerHTML = fileThumbBrowseHTML;
			}
			document.all.addbutton.style.visibility = '';
			document.all.upload_file_row.height = '';
		}
		else
		{
			document.getElementById("upload_file_row").height = '';
			document.getElementById("file_browse").innerHTML = '';
			if(document.getElementById("file_thumb_browse"))
			{
				document.getElementById("file_thumb_browse").innerHTML = fileThumbBrowseHTML;
			}
			document.getElementById("addbutton").style.visibility = '';
		}
	}
	gFileuploadCounter = 2;
}

function InitForm()
{
	gFileuploadCounter = 2;
	if(document.all)
	{
		document.all.file_browse.innerHTML = '';
		<!-- BEGIN switch_manual_thumbnail -->
		document.all.file_thumb_browse.innerHTML = '';
		<!-- END switch_manual_thumbnail -->
		document.all.addbutton.style.visibility = '{DYNAMIC_GENERATION_STATUS}';
	}
	else
	{
		document.getElementById("file_browse").innerHTML = '';
		<!-- BEGIN switch_manual_thumbnail -->
		document.getElementById("file_thumb_browse").innerHTML = '';
		<!-- END switch_manual_thumbnail -->
		document.getElementById("addbutton").style.visibility = '{DYNAMIC_GENERATION_STATUS}';
	}


}
//-->
</script>
<!-- END switch_nuffload_disabled -->

<div class="main">
	<form name="upload" action="{S_ALBUM_ACTION}" method="post" enctype="multipart/form-data" class="frm-form">
		<div class="main-head"><h1 class="page-title">{L_UPLOAD_PIC}</h1></div>
		<div class="main-content style1">
	<fieldset class="frm-set">
		<dl>
			<dt><label>{L_PIC_TITLE}</label>:</dt>
			<dd><input class="inputbox" type="text" name="pic_title" /></dd>
		</dl>
		<dl>
			<dt><label>{L_PIC_DESC}:</label></dt>
			<dd><textarea class="inputbox" cols="60" rows="4" name="pic_desc"></textarea><br />
				<span class="italic">{L_PLAIN_TEXT_ONLY}</span>
			</dd>
		</dl>
		<!-- BEGIN switch_nuffload_enabled -->
		<dl>
			<dt><label>{L_UPLOAD_PIC_FROM_MACHINE}:</label></dt>
			<!-- BEGIN switch_multiple_uploads -->
			<dd><a href="javascript:addInput()">{ADD_FIELD}</a><br /><a href="javascript:deleteInput()">{REMOVE_FIELD}</a></dd>
			<!-- END switch_multiple_uploads -->
		</dl>
		<!-- END switch_nuffload_enabled -->

		<!-- BEGIN switch_nuffload_disabled -->
		<dl>
			<dt><label>{L_UPLOAD_PIC_FROM_MACHINE}:</label></dt>
			<dd id="upload_file_row"><input type="file" name="pic_file[]" />
				<!-- BEGIN switch_multiple_uploads -->
				<span id="addbutton" class="gen">&nbsp;<input type="button" value="{L_ADD_FILE}" onclick="AddFileField()" class="button2" /></span>
				<!-- END switch_multiple_uploads -->
				<div id="file_browse"></div>
			</dd>
		</dl>
		<!-- BEGIN switch_multiple_uploads -->
		<dl>
			<dt>&nbsp;</dt>
			<dd><input type="button" value="{DELETE_ALL_FIELD}" onclick="RemoveFileField()" class="button2" /></dd>
		</dl>
		<!-- END switch_multiple_uploads -->
		<!-- END switch_nuffload_disabled -->

		<!-- BEGIN switch_manual_thumbnail -->
		<dl>
			<dt><label>{L_UPLOAD_THUMBNAIL}:</label></dt>
			<!-- BEGIN switch_nuffload_enabled -->
			<dd><input class="button2" type="file" name="pic_thumbnail" /></dd>
			<!-- END switch_nuffload_enabled -->
		</dl>

		<!-- BEGIN switch_nuffload_disabled -->
		<div id="file_thumb_browse"></div>
		<!-- END switch_nuffload_disabled -->
		<dl>
			<dt><label>{L_THUMBNAIL_SIZE}:</label></dt>
			<dd><strong>{S_THUMBNAIL_SIZE}</strong></dd>
		</dl>
		<!-- END switch_manual_thumbnail -->
		<dl>
			<dt><label>{L_UPLOAD_TO_CATEGORY}:</label></dt>
			<dd>{SELECT_CAT}</dd>
		</dl>
		<!-- BEGIN switch_nuffload_disabled -->
		<dl>
			<dt><label>{L_MAX_UPLOADSIZE}:</label></dt>
			<dd>{S_MAX_FILESIZE} Mo / {S_MAX_WIDTH} x {S_MAX_HEIGHT} px</dd>
		</dl>
		<!-- END switch_nuffload_disabled -->
		<!-- BEGIN switch_nuffload_enabled -->
		<dl>
			<dt><label>{L_ALLOWED_ZIP}:</label></dt>
			<dd><strong>{S_ZIP}</strong></dd>
		</dl>
		<!-- END switch_nuffload_enabled -->
	</fieldset>
<fieldset class="frm-set">
	<dl class="frm-buttons">
		<dt>&nbsp;</dt>
		<dd>
			<!-- BEGIN switch_nuffload_enabled -->
			<input type="reset" value="{L_RESET}" class="button2" />&nbsp;
			<input type="submit" name="submit" value="{L_SUBMIT}" class="button1" />
			<!-- END switch_nuffload_enabled -->
			<!-- BEGIN switch_nuffload_disabled -->
			<input type="reset" value="{L_RESET}" class="button2" onclick="InitForm();" />&nbsp;
			<input type="submit" name="submit" value="{L_SUBMIT}" class="button1" />
			<!-- END switch_nuffload_disabled -->
		</dd>
	</dl>
</fieldset>
<script type="text/javascript">
//<![CDATA[
InitForm();
//]]>
</script>
</div>
</form>

</div>
