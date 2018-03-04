$(()=>{
  ajax({
    type:'get',
    url:'sidebar.html'
  }).then(html=>{
    $('.sidebar').html(html);
  })
})