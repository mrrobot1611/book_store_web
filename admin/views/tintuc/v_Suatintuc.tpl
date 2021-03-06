<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
  $(function() {
    $( "#ngay_dang" ).datepicker({
		changeMonth: true,
      	changeYear: true
		});
	$( "#ngay_dang").datepicker( "option", "dateFormat","yy-mm-dd");
	$( "#ngay_dang").val("{$tin_tuc->ngay_dang}")	
  });
  </script>
<script src="../public/ckeditor/ckeditor.js"></script>
<div class="content-box-header">
  <h3>{$tieude}</h3>
  <div class="clear"></div>
</div>
<!-- End .content-box-header -->
<div class="content-box-content">
  <div class="tab-content default-tab" id="tab1">
    <form action="#" method="post" enctype="multipart/form-data">
        <fieldset>
          
          <p>
            <label>Tiêu đề tin</label>
            <input class="text-input small-input" type="text" id="tieu_de" name="tieu_de" value="{$tin_tuc->tieu_de_tin}" />
          </p>
          <p>
            <label>Nội dung tóm tắt</label>
            <textarea name="tom_tat" class="text-input medium-input ckeditor" id="medium-input">
            {$tin_tuc->noi_dung_tom_tat}
            </textarea>
          <p>
            <label>Nội dung chi tiết</label>
            <textarea name="chi_tiet" class="ckeditor" id="chi_tiet">
            {$tin_tuc->noi_dung_chi_tiet}
            </textarea>
            <script>
            ckeditor.replace("chi_tiet");
            </script>
          </p>
          <p>Trạng thái
            <input type="text" name="trang_thai" id="trang_thai" value="{$tin_tuc->trang_thai}">
          </p>
          <p><img src="../public/layout/hinh_tin_tuc/{$tin_tuc->hinh_dai_dien}"  width="100px" />
          <p>
          <p>
            <label>Thay đổi hình đại diện</label>
            <input type="file" name="hinh" />
          <p>Id loại tin tức
            <input class="text-input small-input" type="text" id="id_loai_tin_tuc" name="id_loai_tin_tuc" value="{$tin_tuc->id_loai_tin_tuc}" />
		  </p>
          <p>
            <label>Ngày đăng bài</label>
            <input class="text-input small-input" type="text" id="ngay_dang" name="ngay_dang" value="{$tin_tuc->ngay_dang}" />
          </p>
          <p>
            <input class="button" type="submit" value="Cập nhật" name="btnCapnhat" />
            <input class="button" type="button" value="Bỏ qua" onclick="window.location='tintuc.php'" />
          </p>
        </fieldset>
        <div class="clear"></div>
        <!-- End .clear -->
        
      </form>
  </div>
  
</div>
