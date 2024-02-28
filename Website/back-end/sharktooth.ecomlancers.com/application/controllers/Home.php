<?php 

class Home extends CI_Controller {
    public function index() {
        $this->load->view('login');
    }
    public function login_action() {
        $username=$this->input->post('username');
        $password=$this->input->post('password');
        $query=$this->db->query("SELECT * FROM users WHERE email='$username' AND password='$password'");
        $no_rows=$query->num_rows();
        $result=$query->result();
        if ($no_rows>0) {
            $result=$result[0];
            $name=$result->name;
            $email=$result->email;
            // $name=$result->name;
            $this->session->set_userdata(array('name'=>$name,'email'=>$email));
            redirect('Home/dashboard');
        }
        else{
            $this->session->set_userdata(array('login_message'=>"Username or password is wrong"));
            redirect('');
        }

    }

    public function dashboard() {
        if(array_key_exists("email",$this->session->userdata())){
            $this->load->view('dashboard');
        }   
        else{
            redirect('');
        }

    }

    function data_collect(){
        print_r(json_encode($this->input->post()));
        $url=$this->input->post('url');
    }
    
}

?>