$(document).ready(function() {
	
	var codeImg = $('<img src="code.png" class="srcIco"/>');
	var addImg = $('<img src="add.png" class="showAllIco"/>');
	var subImg = $('<img src="sub.png" class="hideAllIco"/>');
	var updImg = $('<img src="upd.png" class="updIco"/>');
	var updateTitle = $('<div id="updateTitle">Update</div>');

	$('.updateMain').prepend(updateTitle);

	$('.updateMain').find('#updateTitle').prepend(updImg);

	$('.code').find('#fileName').prepend(codeImg);
	$('.code').find('#fileName').append(subImg);
	$('.code').find('#fileName').append(addImg);
	

	$('.code').find('#fileName').find('.showAllIco').on('click', function() {
		$(this).parent().parent().find('#source').slideDown(600);
	});

	$('.code').find('#fileName').find('.hideAllIco').on('click', function() {
		$(this).parent().parent().find('#source').slideUp(600);
	});

	$('.code').find('#fileName').find('img').mouseenter(function()
	{
		$(this).fadeTo("fast", 0.5);
	});

	$('.code').find('#fileName').find('img').mouseleave(function()
	{
		$(this).fadeTo("fast", 1);
	});

	$('.updateMain').find('#updateTitle').find('img').mouseenter(function()
	{
		$(this).fadeTo("fast", 0.5);
	});

	$('.updateMain').find('#updateTitle').find('img').mouseleave(function()
	{
		$(this).fadeTo("fast", 1);
	});

});

/*
Picture Links -
Update: http://1.bp.blogspot.com/-Gj5qACoPZDw/UvnuiMS2TZI/AAAAAAAAAbY/mhloF7SU6dU/s1600/upd_2.png
Less: http://3.bp.blogspot.com/-LWl41OpH9gQ/UvntYdtzSsI/AAAAAAAAAbQ/YUzLPjHR8DE/s1600/sub_2.png
More:http://2.bp.blogspot.com/-ZLhymCxeQuE/UvntUuXt2PI/AAAAAAAAAbA/6Zbo-y63eJo/s1600/add_2.png
Code: http://4.bp.blogspot.com/-JxwY9xGVK2w/UvntWHawvUI/AAAAAAAAAbI/Ca4BZSlnMWQ/s1600/code_2.png
*/