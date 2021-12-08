// localStorage.removeItem('data');
//bikin fungsi cek_user
var id_user
function cek_user(){
  //bikin var data = localStorage.getItem('data'); dan kemudian cek apakah data ada atau tidak
  let data = localStorage.getItem('data');
  //jika data tidak ada
  if(data == null || data == ''){
    //maka akan diarahkan ke halaman login
    swal({
      title: "Akses Ditolak",
      text: "Anda harus login terlebih dahulu",
      type: "error",
      confirmButtonColor: "#DD6B55",
      confirmButtonText: "OK",
      closeOnConfirm: false,
      dangerMode: true
    }).then(function(){
      window.location.href = "index.html";
    });
  }else{
    data = JSON.parse(data)
    id_user = data.id_user
    // console.log(data)

    $.ajax({
      url: url+"cek_data_user",
      type: 'GET',
      data: {data:data},
      headers: {
        //basicAuth username="Kicap_karan", password="karan_kicap456" 
        'Authorization': 'Basic ' + btoa('Kicap_karan' + ':' + 'karan_kicap456') 
      },
      beforeSend: function(){
        sedang_proses();
      },
      success: function(response){
        $.unblockUI();
        // console.log(response)
        $(".nama_usernya").html(data.nama)
      },
      error: function(response){
        $.unblockUI();
        if(response.status == 401){
          swal({
            title: "Akses Ditolak",
            text: "Anda harus login terlebih dahulu",
            type: "error",
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "OK",
            closeOnConfirm: false,
            dangerMode: true
          }).
          then(function(){
            window.location.href = "index.html";
          });
        }else{
          swal({
            icon: "error",
            text: "Jaringan Mungkin Bermasalah \n Sila Reload Kembali Halaman",
            type: "error",
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "OK",
            closeOnConfirm: false,
            dangerMode: true,
            value: true
          }).
          then(function(value){
            if (value) {
                location.reload();
            }
                  
          });
        }
    

      }
    });
  }

}

cek_user()

function logout(){
  //create swal "Yakin Ingin Keluar?"
  swal({
    icon: "info",
    title: "Yakin Ingin Keluar?",
    text: "",
    type: "info",
    showCancelButton: true,
    confirmButtonColor: "#DD6B55",
    confirmButtonText: "Ya",
    cancelButtonText: "Tidak",
    closeOnConfirm: false,
    closeOnCancel: false
  }).then(function(isConfirm){
    if (isConfirm) {
      //jika yakin maka akan menghapus data localStorage dan diarahkan ke halaman login
      localStorage.removeItem('data');
      //create swal "Berhasil Keluar"
      swal({
        icon: "success",
        title: "Terima Kasih",
        text: "Anda Telah Logout",
        type: "success",
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "OK",
        closeOnConfirm: false,
      }).then(function(){
        window.location.href = "index.html";
      });

    } 
  })

}