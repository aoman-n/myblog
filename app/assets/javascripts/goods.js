$(function(){
  $('.good-button').on('click',function(){
    var articleId = $('.good-button').data('id');
    console.log(articleId);
    $.ajax ({
      url: `/articles/${articleId}/goods`,
      type: "POST",
      dataType: 'json'
    })
    .always(function(good){
      $('.good-button').attr('style','background: #3ADF00;')
      $('.good-button').html(`<i class="fa fa-fw fa-check" style="margin-right: 2px; color: white;"></i>
                              <span style="color: white;">${good.count}</span>`
                            );
    })
  });
});
