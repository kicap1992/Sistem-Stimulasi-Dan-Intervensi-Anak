<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, DELETE, PUT');
header('Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, Authorization');
header('Access-Control-Allow-Credentials: true');
header('Content-Type: application/json');

defined('BASEPATH') or exit('No direct script access allowed');

use chriskacerguis\RestServer\RestController;

class Api extends RestController
{
  function __construct()
  {
      parent::__construct();
      $this->load->model('model');;
      // $this->db->query("SET sql_mode = '' ");
      date_default_timezone_set("Asia/Kuala_Lumpur");
  }

  public function index_get()
  {
    $this->response(['message' => 'Halo Bosku'], 200);
    // redirect(base_url());

  }

  // -----------------------------------------------------------------------------------------------------------
  
  public function cek_data_kemampuan_gerak_kasar_get()
  {
    
    $id = $this->get('id');
    // jika variable id bukan 1 hingga 5 maka akan menampilkan pesan error
    if ($id != 1 && $id != 2 && $id != 3 && $id != 4 && $id != 5) {
      $this->response(['status' => false, 'message' => 'id tidak valid'], 400);
    }

    $cek_data = $this->model->tampil_data_where('tb_data',['id_data' => $id])->result();

    // jika count($cek_data) > 0 maka akan message "ya" dengan menampilkan data, jika tidak akan menampilkan message "tidak"
    if (count($cek_data) > 0) {
      $this->response(['status' => true, 'message' => 'ya', 'data' => $cek_data], 200);
    } else {
      $this->response(['status' => false, 'message' => 'tidak'], 200);
    }
    
    

    

  }

  // -----------------------------------------------------------------------------------------------------------
  

  public function login_admin_get()
  {
    $username = $this->get('username');
    $password = $this->get('password');

    $cek_data = $this->model->tampil_data_where('tb_login',['username' => $username , 'password' =>md5($password)])->result();

    if (count($cek_data) > 0) {
      $cek_data_admin = $this->model->tampil_data_where('tb_admin',['id_admin' => $cek_data[0]->id_admin])->result()[0];
      $this->response(['res' => 'ok','id_admin' => $cek_data_admin->id_admin, 'nama' => $cek_data_admin->nama], 200);
    }else{
      $this->response(['res' => 'ko'], 400);
    }

    // $this->response(['res' => 'ok','url' => 'hehehe'], 200);

  }

  public function login_admin_nik_get()
  {
    $id_admin = $this->get('id_admin');

    $cek_data = $this->model->tampil_data_where('tb_admin',['id_admin' => $id_admin])->result();

    if (count($cek_data) > 0) {
      // $cek_data_admin = $this->model->tampil_data_where('tb_admin',['id_admin' => $cek_data[0]->id_admin])->result()[0];
      $this->response(['res' => 'ok'], 200);
    }else{
      $this->response(['res' => 'ko'], 200);
    }

    // $this->response(['res' => 'ok','url' => 'hehehe'], 200);

  }

  public function tambah_kategori_post()
  {
    $kategori = $this->post('kategori');
    $keterangan = $this->post('keterangan');
    $foto = $_FILES['foto'];

    $cek_id = $this->model->cek_last_ai('tb_kategori');
    $dir = "../moris_admin/assets/images/kategori/".$cek_id.'/';
    if(is_dir($dir) === false )
    {
      mkdir($dir);
    }

    

    move_uploaded_file($foto['tmp_name'],$dir.$foto['name']);

    $this->model->insert('tb_kategori',['kategori' => $kategori , 'keterangan' => $keterangan, 'foto' => 'assets/images/kategori/'.$cek_id.'/'.$foto['name']]);

    // print_r(is_dir($dir));

    $this->response(['res' => 'sini_tambah_kategori','des' => $foto['name']], 200);
  }

  public function edit_kategori_post()
  {
    $id = $this->post('id');
    $kategori = $this->post('kategori');
    $keterangan = $this->post('keterangan');
    $ada_foto = $this->post('ada_foto');
    $foto = ($ada_foto == 'ada foto') ? $_FILES['foto'] : null;
    

    // $cek_id = $this->model->cek_last_ai('tb_kategori');
    $dir = "../moris_admin/assets/images/kategori/".$id.'/';
    
    if ($ada_foto == 'ada foto') {
      $files = glob($dir.'*'); // get all file names
      foreach($files as $file){ // iterate files
        if(is_file($file)) {
          unlink($file); // delete file
        }
      }
      move_uploaded_file($foto['tmp_name'],$dir.$foto['name']);
      $this->model->update('tb_kategori',['id_kategori' => $id],['kategori' => $kategori , 'keterangan' => $keterangan, 'foto' => 'assets/images/kategori/'.$id.'/'.$foto['name']]);
    } else if ($ada_foto == 'tiada foto') {
      $this->model->update('tb_kategori',['id_kategori' => $id],['kategori' => $kategori , 'keterangan' => $keterangan]);
    }
    $this->response(['res' => 'ok'], 200);
    

    // if(is_dir($dir) === false )
    // {
    //   mkdir($dir);
    // }

    

    // move_uploaded_file($foto['tmp_name'],$dir.$foto['name']);

    // $this->model->insert('tb_kategori',['kategori' => $kategori , 'keterangan' => $keterangan, 'foto' => 'assets/images/kategori/'.$cek_id.'/'.$foto['name']]);

    // print_r(is_dir($dir));

    // $this->response(['res' => 'sini_tambah_kategori','des' => $foto['name']], 200);
  }

  public function list_kategori_get()
  {
    $cek_data = $this->model->tampil_data_keseluruhan('tb_kategori')->result();
    $this->response(['res' => 'ok', 'data' => $cek_data], 200);
  }

  public function detail_produk_get()
  {
    $id = $this->get('id');
    $cek_data = $this->model->tampil_data_where('tb_kategori',['id_kategori' => $id])->result();
    $cek_data = (count($cek_data) > 0) ? $cek_data[0] : null ;
    $this->response(['res' => $id, 'data' => $cek_data], 200);
  }

  public function update_detail_put()
  {
    $id = $this->put('id');
    $detail = $this->put('json_detail');
    $this->model->update('tb_kategori',['id_kategori' => $id],['json_detail' => $detail]);
    $this->response(['res' => 'ok'], 200);
  }

  public function delete_kategori_delete()
  {
    $id = $this->delete('id');
    
    $dir = "../moris_admin/assets/images/kategori/".$id.'/';
    
    $files = glob($dir.'*', GLOB_MARK); // get all file names
    foreach($files as $file){ // iterate files
      if(is_file($file)) {
        unlink($file); // delete file
      }
    }
    rmdir($dir);

    $cek_data = $this->model->tampil_data_where('tb_produk' , ['id_kategori' => $id])->result();
    if (count($cek_data) > 0) {
      foreach ($cek_data as $key => $value) {
        $dir = "../moris_admin/assets/images/produk/".$value->id_produk.'/';
    
        $files = glob($dir.'*', GLOB_MARK); // get all file names
        foreach($files as $file){ // iterate files
          if(is_file($file)) {
            unlink($file); // delete file
          }
        }
        rmdir($dir);
      }
    }
    $this->model->delete('tb_kategori',['id_kategori' => $id]);
    $this->response(['res' => $id], 200);
  }
  
  public function tambah_produk_post()
  {
    $id_produk = $this->post('id_produk');
    $json_detail = $this->post('json_detail');
    $deskripsi = $this->post('deskripsi');
    $nama = $this->post('nama');
    $foto = $_FILES['files'];

    $cek_id = $this->model->cek_last_ai('tb_produk');
    $dir = "../moris_admin/assets/images/produk/".$cek_id.'/';
    if(is_dir($dir) === false )
    {
      mkdir($dir);
    }

    $countfiles = count($foto['name']);
    $array_foto = [];
    for($index = 0;$index < $countfiles;$index++){
      
      $filename = $foto['name'][$index];
      $path = $dir.$filename;
      move_uploaded_file($foto['tmp_name'][$index],$path);
      $array_foto = array_merge($array_foto,["assets/images/produk/".$cek_id.'/'.$filename]);
    }


    $this->model->insert('tb_produk',['id_kategori' => $id_produk, 'nama' => $nama , 'deskripsi' => $deskripsi , 'json_detail' => $json_detail, 'foto' => json_encode($array_foto)]);
    $this->response(['res' => 'ok'], 200);
  }

  public function edit_produk_post()
  {
    $id_produk = $this->post('id_produk');
    $json_detail = $this->post('json_detail');
    $deskripsi = $this->post('deskripsi');
    $nama = $this->post('nama');
    $ada_foto = ($this->post('ada_foto') == 'ada foto') ? 'ada foto': 'tiada foto';
    $foto = ($ada_foto == 'ada foto') ? $_FILES['files']: null;

    // $this->response(['res' => $foto], 200);
    $dir = "../moris_admin/assets/images/produk/".$id_produk.'/';
    
    if ($ada_foto == 'ada foto') {
      $files = glob($dir.'*'); // get all file names
      foreach($files as $file){ // iterate files
        if(is_file($file)) {
          unlink($file); // delete file
        }
      }
      
      $countfiles = count($foto['name']);
      $array_foto = [];
      for($index = 0;$index < $countfiles;$index++){
        
        $filename = $foto['name'][$index];
        $path = $dir.$filename;
        move_uploaded_file($foto['tmp_name'][$index],$path);
        $array_foto = array_merge($array_foto,["assets/images/produk/".$id_produk.'/'.$filename]);
      }


      $this->model->update('tb_produk',['id_produk' => $id_produk],[ 'nama' => $nama , 'deskripsi' => $deskripsi , 'json_detail' => $json_detail, 'foto' => json_encode($array_foto)]);
    } else {
      $this->model->update('tb_produk',['id_produk' => $id_produk],[ 'nama' => $nama , 'deskripsi' => $deskripsi , 'json_detail' => $json_detail]);
    }
    
    $this->response(['res' => $foto], 200);
  }

  public function delete_produk_delete()
  {
    $id = $this->delete('id');
    $dir = "../moris_admin/assets/images/produk/".$id.'/';
    
    $files = glob($dir.'*', GLOB_MARK); // get all file names
    foreach($files as $file){ // iterate files
      if(is_file($file)) {
        unlink($file); // delete file
      }
    }
    rmdir($dir);
    $this->model->delete('tb_produk',['id_produk' => $id]);
    $this->response(['res' => $id], 200);
  }

  public function array_produk_get()
  {
    $id = $this->get('id');
    $cek_data = $this->model->custom_query("SELECT a.id_produk as id_produk , a.nama as nama ,b.kategori as kategori, a.deskripsi as deskripsi, a.json_detail as json_detail, a.foto as foto, a.date_created as date_created from tb_produk a JOIN tb_kategori b on a.id_kategori = b.id_kategori where a.id_kategori =".$id)->result();
    $this->response(['res' => $id,'data' => $cek_data], 200);
  }
  
  public function produk_detail_get()
  {
    $id = $this->get('id');
    $cek_data = $this->model->custom_query("SELECT a.id_produk as id_produk , a.nama as nama ,b.kategori as kategori, b.json_detail as json_detail_kategori, a.deskripsi as deskripsi, a.json_detail as json_detail, a.foto as foto, a.date_created as date_created from tb_produk a JOIN tb_kategori b on a.id_kategori = b.id_kategori where a.id_produk =".$id)->result()[0];
    $this->response(['res' => $id,'data' => $cek_data], 200);
  }

  
}

