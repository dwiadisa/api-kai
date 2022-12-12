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
        $id = $this->get('id');
        if ($id == '') {
            $kereta = $this->db->get('kereta_api')->result();
        } else {
            $this->db->where('id', $id);
            $kereta = $this->db->get('kereta_api')->result();
        }

        $this->response($kereta, 200);
    }
}

/* End of file Kai.php and path \application\controllers\Kai.php */
