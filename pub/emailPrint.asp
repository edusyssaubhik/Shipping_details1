

<div class="tools-dock-wrapper">
<div class="tools-dock" style="display: block;">
<div class="tools-dock-left"> </div>
<span class="tool email st_email_large" st_processed="yes">
Email
<span class="stButton" style="text-decoration:none;color:#000000;display:inline-block;cursor:pointer;">
<span class="stLarge" style="background-image: url("http://w.sharethis.com/images/email_32.png");"></span>
<img src="http://w.sharethis.com/images/check-big.png" style="position: absolute; top: -7px; right: -7px; width: 19px; height: 19px; max-width: 19px; max-height: 19px; display: none;">
</span>
</span>
<a class="tool print" href="#print"> Print </a>
<div class="tools-dock-right"> </div>
</div>
</div>

<script charset="utf-8" type="text/javascript">
(function($) {
$(document).ready(function() {
// Show docks (crude way to hide JS-disabled users).
$('.tools-dock').each(function() {
$(this).css('display','block');
});
// Bind appropriate functions.
$('.tools-dock').each(function() {
$(this).delegate('.print', 'click', function() {
window.print();
});
});
});
})(jQuery);
</script>