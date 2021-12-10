// sessionStorage.removeItem('data')
var data,nama;

//create function cek_admin
function cek_admin(){
  //create tenary if sessionStorage.getItem('data') is not null or "",then JSON.parse(sessionStorage.getItem('data')) else null
  data = (sessionStorage.getItem('data')!=null || sessionStorage.getItem('data')!="") ? JSON.parse(sessionStorage.getItem('data')):null;

  //create if data is not null then  ajax request to server,else sessionStorage.removeItem('data') swal "Anda belum login" redirect to index.html
  if(data!=null){
    $.ajax({
      url: url+"cek_admin?id_admin="+data.id_admin,
      type: "GET",
      crossDomain: true,
      beforeSend: function (request) {
        sedang_proses()
        request.setRequestHeader("Authorization", "Basic " + btoa("Kicap_karan:karan_kicap456"));
          
      },
      success: function(response){
        // console.log(response)
        $(".nama_admin").html(data.nama)
        $.unblockUI();
      },
      error: function(response){
        $.unblockUI();
        if (response.status == 400) {
          sessionStorage.removeItem('data');
          swal({
            icon: "error",
            title: "Error",
            text: "Anda Harus Login",
            type: "error",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "OK",
            closeOnConfirm: false,
            dangerMode: true,
          }).
          then(function(value){
            window.location.href = "index.html";
          });
        }
          
        
      }
    });
  }else{
    sessionStorage.removeItem('data');
    swal({
      icon: "error",
      title: "Error",
      text: "Anda Belum Login",
      type: "error",
      showCancelButton: false,
      confirmButtonColor: "#DD6B55",
      confirmButtonText: "OK",
      closeOnConfirm: false,
      dangerMode: true,
    }).
    then(function(value){
      window.location.href = "index.html";
    });
   
  }
  
}
cek_admin();

function cek_data_user(){
  //create ajax request to server
  $.ajax({
    url: url+"cek_data_user_from_admin",
    type: "GET",
    crossDomain: true,
    beforeSend: function (request) {
      sedang_proses()
      request.setRequestHeader("Authorization", "Basic " + btoa("Kicap_karan:karan_kicap456"));
        
    }
  }).done(function(response){
    // console.log(response)
    $.unblockUI();
    $(".jumlah_data").html(response.jumlah_data)
    $(".jumlah_user").html(response.data_user)
    // $("#data_user").html(response)
  }).fail(function(response){
    $.unblockUI();
  });
}
cek_data_user();

function logout(){
  //create swal info "Anda yakin ingin keluar?"
  swal({
    title: "Logout?",
    text: "Anda yakin ingin keluar?",
    icon: "info",
    buttons: true,
    dangerMode: true,
  }).then((willDelete) => {
    //create if willDelete is true then sessionStorage.removeItem('data') swal "Anda telah keluar" redirect to index.html
    if (willDelete) {
      sessionStorage.removeItem('data');
      swal("Anda telah keluar", {
        icon: "success",
      }).then(function(){
        window.location.href = "index.html";
      });
    } 
  });

}