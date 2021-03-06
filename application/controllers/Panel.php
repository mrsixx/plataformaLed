<?php
/**
*  Controlador com métodos pertinentes ao acesso do usuário as páginas do painel ao efetuar login
*  @author Matheus Antonio
*/
defined('BASEPATH') OR exit('No direct script access allowed');

class Panel extends CI_Controller {
	//função index, verifica a situação da plataforma para direcionar o usuário para um destino
	public function index($erro = null){	
		//verificando se a sessão existe, caso exista mando para o painel 
		$this->load->library('session');
		if($this->session->has_userdata('login')){
			$usuario = $this->session->login;
			$cod = $usuario['cod'];
			$tipo = $usuario['tipo'];

			//verificando se a configuração de ambiente já foi feita
			$this->load->helper('inicia');

			if(verificaAmbiente()){
				//recebo o array com as informações da interface
				$this->load->helper('interface');
				$data = preencheInterface($usuario,'principal');

				//carregando a view enquanto passo as informações
				$data['title'] = "Painel";
				$data['content'] = "home";
				$data['sidebar'] = "home";


				switch ($tipo) {
					case 1:
						$this->load->model('Usuario','usuario');
						$this->load->model('BatePapo','chat');
						$this->load->model('Mural','mural');
						$this->load->model('Link','links');
						$this->load->model('Library','lib');
						$data['infoHome'] = array(
							'msgEnviadas' => $this->chat->contaMsg(array('CodRemetente' => $cod)),
							'msgRecebidas' => $this->chat->contaMsg(array('CodDestino' => $cod)),
							'postsFeitos' => $this->mural->retornaPostagens(array('postagem.CodUsuario' => $cod)),
							'livrosEnviados' => $this->lib->retornaLivro(array('us.CodUsuario'=> $cod)),

							'usuariosAtivos' => $this->usuario->contaUser(array('Status'=>1)),
							'usuariosCadastrados' => $this->usuario->contaUser("`CodUsuario` IS NOT NULL"),
							'qtdAlunos' => $this->usuario->contaUser(array('CodTipoUsuario'=>3,'Status'=> 1)),
							'qtdFuncionarios' => $this->usuario->contaUser(array('CodTipoUsuario'=>2,'Status'=> 1)),
							'qtdProfessores' => $this->usuario->contaUser(array('CodTipoUsuario'=>4,'Status'=> 1)),
							'qtdAdmin' => $this->usuario->contaUser(array('CodTipoUsuario'=>1,'Status'=> 1)),
							'qtdMsg' => $this->chat->contaMsg(),
							'qtdPost' => $this->mural->retornaPostagens(null,'num'),
							'qtdFerramenta' => $this->links->retornaLink(null,true),
							'qtdArquivo' => $this->lib->retornaLivro(null,true)
						);
						break;
					
					case 3:
						$this->load->model('Usuario','usuario');
						$this->load->model('BatePapo','chat');
						$this->load->model('Mural','mural');
						$this->load->model('Link','links');
						$this->load->model('Library','lib');
						$this->load->model('Escola','escola');

						$turma = $this->escola->getAlunoTurma(array('at.CodUsuario' => $cod),'array');
						$turma = $this->escola->getTurma(array('CodTurma' => $turma['CodTurma']),'array');
						// $curso = $this->escola->getCurso(array('Cod'));
						$data['infoHome'] = array(
							'curso' => utf8_encode($turma['Nome']),
							'turma' => $turma['Modulo']."º ".utf8_encode($turma['NomeTurma']),
							'publicacoes' => $this->mural->retornaPostagens(array('usuario.CodUsuario' => $cod)),
							'arquivos' =>1,
							'taskExe' =>1,
							'taskPendente' =>1,

						);
						break;
				}





				if(atualizaStatus($cod))
					$this->load->view('panel/layout', $data);
			}else{
				if($tipo == 1)
					redirect(base_url('configuracao-ambiente'));
				else
					redirect(base_url());
			}
		}else{
			//se não houver sessão, então mando de volta pois não existiu um login
			redirect(base_url());
		}
	}

	public function busca(){
		$this->load->library('session');
		if($this->session->has_userdata('login')){
			$usuario = $this->session->login;
			$cod = $usuario['cod'];
			$tipo = $usuario['tipo'];

			//verificando se a configuração de ambiente já foi feita
			$this->load->helper('inicia');

			if(verificaAmbiente()){
				//recebo o array com as informações da interface
				$this->load->helper('interface');
				$data = preencheInterface($usuario,'principal');
				

				//recupero os valores e efetuo a busca
				if(isset($_GET['q']) && $_GET['q'] != null){
					$busca = $this->input->get('q');

					$this->load->model('Usuario');
					$data['resultado'] = $this->Usuario->getUser("`Nome` LIKE '$busca%' ESCAPE '!' OR  `Sobrenome` LIKE '$busca%' ESCAPE '!' OR  `Nickname` LIKE '$busca%' ESCAPE '!'",'obj');
					$data['pageHeader'] = (!empty($data['resultado']))? "Resultados para "."<i>''$busca''</i>" : "Não há resultados para "."<i>''$busca''</i>";
				}
				else{
					redirect(base_url('panel'));
				}

				//carregando a view enquanto passo as informações
				$data['title'] = "Resultado da busca";
				$data['content'] = "busca";
				$data['sidebar'] = "home";
				$data['files'] = array('img do perfil' => '<style>.img-comentario{border-radius: 100px;}</style>');


				$this->load->view('panel/layout', $data);
			}
			else{
				redirect(base_url('configuracao-ambiente'));
			}
		}
	}

	public function mural(){
		//verificando se a sessão existe, caso exista mando para o painel 
		$this->load->library('session');
		if($this->session->has_userdata('login')){
			$usuario = $this->session->login;
			$cod = $usuario['cod'];
			$tipo = $usuario['tipo'];

			///verificando se a configuração de ambiente já foi feita
			$this->load->helper('inicia');

			if(verificaAmbiente()){
				//recebo o array com as informações da interface
				$this->load->helper('interface');
				$data = preencheInterface($usuario,'mural');

				//carregando a view enquanto passo as informações
				$data['title'] = "Mural";
				$data['content'] = "mural";
				$data['sidebar'] = "mural";
				//definindo os valores que serão exibidos dinamicamente na sidebar de acordo com o tipo de usuário
				$this->load->model('Mural','mural');
				$this->load->model('Escola','escola');
				$this->load->helper('sidebar');
				$data['files'] = array('mural' => '<link href="'.base_url("assets/css/mural.css").'" rel="stylesheet">');	


				switch ($tipo) {
					case 1:
						$data['murais'] = array(
							'Seus murais' => $this->mural->retornaMural(array('CodUsuario' => $cod)),
							'Murais existentes' => $this->escola->getMural(null,TRUE)
						);
						break;
					case 4:
						$data['murais'] = array(
							'Seus murais' => $this->mural->retornaMural(array('CodUsuario' => $cod)),
							'Turmas' => $this->mural->retornaMural(array('cp.CodProfessor'=> $cod),'prof')
						);
						break;
					default:
						$data['murais'] = array(
							'Seus murais' => $this->mural->retornaMural(array('CodUsuario' => $cod))
						);
						break;
				}

				if(atualizaStatus($cod))
					$this->load->view('panel/layout', $data);
			}else{
				redirect(base_url('configuracao-ambiente'));
			}

		}else{
			//se não houver sessão, então mando de volta pois não existiu um login
			redirect(base_url());
		}
	}


	public function help(){
		$this->load->library('session');
		if($this->session->has_userdata('login')){
			$usuario = $this->session->login;
			$cod = $usuario['cod'];
			$tipo = $usuario['tipo'];
				//recebo o array com as informações da interface
				$this->load->helper('interface');
				$data = preencheInterface($usuario);

				echo "ajuda";
		}else{
			//se não houver sessão, então mando de volta pois não existiu um login
			redirect(base_url());
		}
	}

	public function settings(){
		$this->load->library('session');
		if($this->session->has_userdata('login')){
			$usuario = $this->session->login;
			$cod = $usuario['cod'];
			$tipo = $usuario['tipo'];


			// if(!empty($curso) && !empty($hierarquia) && !empty($turma) && !empty($compcurricular)){
				// if(!empty($curso) && !empty($turma)){
				//recebo o array com as informações da interface
				$this->load->helper('interface');
				$data = preencheInterface($usuario);
				echo "configurações";
			// }else{
				// redirect(base_url('configuracao-ambiente'));
			// }

		}else{
			//se não houver sessão, então mando de volta pois não existiu um login
			redirect(base_url());
		}
	}

	public function logout(){
		$usuario = $this->input->get('s');
		$this->load->library('session');
		//dar um unset aqui dps
		unset($this->session->login);
		$this->session->sess_destroy($usuario);
		// $this->session->sess_destroy();
		redirect(base_url());
	}


	



	public function attNotificacao(){
		$this->load->helper('interface');
		attNotificacao();
	}
	
	public function avatar(){
		$token = $this->uri->segment(3);

		$this->load->model('Usuario');
		$usuario = $this->Usuario->getUser(array('Token' => $token));
		if(!isset($usuario) || empty($usuario))
			return false;

		$data['coduser'] = $usuario['CodUsuario'];
		$data['title'] = "Avatar";
		$data['content'] = "avatar";
		// $data['filesfooter'] = array(
		// 	'modal bem-vindo' => '<script type="text/javascript">
		// 							$(document).ready(function() {
		// 								$("#welcome").modal("show");
		// 							});

		// 						</script>'
		// );
		$this->load->model('Avatar');
		$data['avatar'] = $this->Avatar->retornaAvatar();
		$data['filesfooter'] = array(
			'avatar' => '<script type="text/javascript" src="'.base_url('assets/js/scripts/cadastro.js').'"></script>'
		);
		$this->load->view('cadastro/layout', $data);
	}

}
