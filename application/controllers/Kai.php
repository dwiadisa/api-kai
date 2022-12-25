<?php
defined('BASEPATH') or exit('No direct script access allowed');
require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;


class Kai extends REST_Controller
{

    public function __construct($config = 'rest')
    {
        parent::__construct($config);
        $this->load->database();
    }

    public function index_get()
    {
        $id = $this->get('id_kereta');
        if ($id == '') {
            $kereta = $this->db->get('kereta_api')->result();
        } else {
            $this->db->where('id_kereta', $id);
            $kereta = $this->db->get('kereta_api')->result();
        }

        $this->response($kereta, 200);
    }
    // menambah data baru
    // POST digunakan sama halnya CREATE di CRUD
    public function index_post()
    {
        $data = array(
            // 'id_kereta' => $this->post('id'),
            'nama_kereta_api' => $this->post('nama'),
            'kelas_kereta' => $this->post('kelas')
        );
        $insert = $this->db->insert('kereta_api', $data);
        if ($insert) {
            $this->response($data, 200);
            # code...
        } else {
            $this->response(array('status' => 'fail', 502));
            # code...
        }
    }
    // put digunakan sama halnya dengan UPDATE di CRUD
    public function index_put()
    {
        $id = $this->put('id');
        $data = array(
            'id_kereta' => $this->put('id'),
            'nama_kereta_api' => $this->put('nama'),
            'kelas_kereta' => $this->put('kelas')
        );
        $this->db->where('id_kereta', $id);
        $update = $this->db->update('kereta_api', $data);
        if ($update) {
            $this->response($data, 200);
        } else {
            $this->response(array('status' => 'fail', 502));
            # code...

        }
    }
    public function index_delete()
    {
        $id = $this->delete('id');
        $this->db->where('id_kereta', $id);
        $delete = $this->db->delete('kereta_api');
        if ($delete) {
            $this->response(array('status' => 'success'), 201);
            # code...
        } else {
            $this->response(array('status' => 'fail'), 502);
            # code...
        }
    }
}

/* End of file Kai.php and path \application\controllers\Kai.php */
