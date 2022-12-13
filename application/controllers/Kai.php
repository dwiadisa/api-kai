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

    public function asdsa()
    {
    }
}

/* End of file Kai.php and path \application\controllers\Kai.php */
