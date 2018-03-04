$(()=>{
  ajax({
    type:'get',
    url:'footer.html'
  }).then(html=>{
    $('.footer').html(html);
  })
})