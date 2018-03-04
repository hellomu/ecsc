$(()=>{
   ajax({
       type:'get',
       url:'header.html'
   }).then(html=>{
      $('.header').html(html);
   })
});