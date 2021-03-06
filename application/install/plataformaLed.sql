-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 10-Ago-2017 às 18:57
-- Versão do servidor: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `plataformaled`
--
CREATE DATABASE IF NOT EXISTS `plataformaled` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `plataformaled`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno-turma`
--

CREATE TABLE `aluno-turma` (
  `CodAluno` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `CodUsuario` bigint(20) NOT NULL,
  `CodTurma` bigint(20) NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `arquivo`
--

CREATE TABLE `arquivo` (
  `CodArquivo` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Descricao` text,
  `Link` text NOT NULL,
  `DataHoraEnvio` datetime NOT NULL,
  `CodUsuario` bigint(20)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao`
--

CREATE TABLE `avaliacao` (
  `CodAvaliacao` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Avaliacao` tinyint(4) NOT NULL,
  `CodConsultor` bigint(20) NOT NULL,
  `CodUsuario` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `avatar`
--

CREATE TABLE `avatar` (
  `CodAvatar` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `CodCorpo` bigint(20),
  `CodCabelo` bigint(20),
  `CodRoupa` bigint(20),
  `CodRosto` bigint(20),
  `CodItem` bigint(20)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cabeloavatar`
--

CREATE TABLE `cabeloavatar` (
  `CodCabelo` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Descricao` text NOT NULL,
  `Link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `campo`
--

CREATE TABLE `campo` (
  `CodCampo` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Questao` longtext NOT NULL,
  `RespostaCerta` longtext,
  `Peso` decimal(10,0) NOT NULL DEFAULT '1',
  `CodTipoCampo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentario`
--

CREATE TABLE `comentario` (
  `CodComentario` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Comentario` text NOT NULL,
  `DataHora` datetime NOT NULL,
  `CodPostagem` bigint(20) NOT NULL,
  `CodUsuario` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `compcurricular`
--

CREATE TABLE `compcurricular` (
  `CodComponente` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Sigla` varchar(10) NOT NULL,
  `CriteriosAvaliacao` text,
  `CodProfessor` bigint(20)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `componente-curso`
--

CREATE TABLE `componente-curso` (
  `CodCompCurso` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `CodCurso` bigint(20) NOT NULL,
  `CodComponente` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `competencia`
--

CREATE TABLE `competencia` (
  `CodCompetencia` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `CodTask` bigint(20) NOT NULL,
  `CodInteligencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `componente`
--

CREATE TABLE `componente` (
  `CodComponente` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `configuracao`
--

CREATE TABLE `configuracao` (
  `CodConfig` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Nome` varchar(20) NOT NULL,
  `Valor` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `conquista`
--

CREATE TABLE `conquista` (
  `CodConquista` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `DataConquista` date NOT NULL,
  `CodInsignia` int(11) NOT NULL,
  `CodUsuario` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `consultoria`
--

CREATE TABLE `consultoria` (
  `CodConsultoria` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `DataHoraConsultoria` datetime NOT NULL,
  `Resposta` text NOT NULL,
  `CodDuvida` bigint(20) NOT NULL,
  `CodConsultor` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `corpoavatar`
--

CREATE TABLE `corpoavatar` (
  `CodCorpo` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Descricao` text NOT NULL,
  `Link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE `curso` (
  `CodCurso` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Duracao` int(11) NOT NULL,
  `Descricao` text,
  `QtdAulas` int(11) NOT NULL,
  `DuracaoAulas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `desempenha-task`
--

CREATE TABLE `desempenha-task` (
  `CodDesempenho` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `DataInicio` datetime NOT NULL,
  `CodTask` bigint(20) NOT NULL,
  `CodUsuario` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `duvida`
--

CREATE TABLE `duvida` (
  `CodDuvida` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Titulo` varchar(200) NOT NULL,
  `DataHora` datetime NOT NULL,
  `Conteudo` text NOT NULL,
  `CodCompCurricular` bigint(20) NOT NULL,
  `CodCriador` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipe`
--

CREATE TABLE `equipe` (
  `CodEquipe` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Nome` varchar(200) DEFAULT NULL,
  `CaminhoArquivo` text,
  `CodTask` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `escola`
--

CREATE TABLE `escola` (
  `CodEscola` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `DataFundacao` date,
  `Rua` varchar(50) NOT NULL,
  `Bairro` varchar(50) NOT NULL,
  `Cep` varchar(9) NOT NULL,
  `Cidade` varchar(50) NOT NULL,
  `Estado` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `evento`
--

CREATE TABLE `evento` (
  `CodEvento` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Data` date NOT NULL,
  `Local` text,
  `Hora` time,
  `Descricao` text NOT NULL,
  `Duracao` int(11),
  `CriadoPor` bigint(20),
  `CodTipoEvento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `experiencia`
--

CREATE TABLE `experiencia` (
  `CodUsuario` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `QtdCinestesica` bigint(20) NOT NULL DEFAULT '0',
  `QtdEspecial` bigint(20) NOT NULL DEFAULT '0',
  `QtdExistencial` bigint(20) NOT NULL DEFAULT '0',
  `QtdInterpessoal` bigint(20) NOT NULL DEFAULT '0',
  `QtdIntrapessoal` bigint(20) NOT NULL DEFAULT '0',
  `QtdLinguistica` bigint(20) NOT NULL DEFAULT '0',
  `QtdLogicoMat` bigint(20) NOT NULL DEFAULT '0',
  `QtdMusical` bigint(20) NOT NULL DEFAULT '0',
  `QtdNaturalista` bigint(20) NOT NULL DEFAULT '0',
  `QtdPratica` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `form-campo`
--

CREATE TABLE `form-campo` (
  `CodFormCampo` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `CodForm` bigint(20) NOT NULL,
  `CodCampo` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `formulario`
--

CREATE TABLE `formulario` (
  `CodForm` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Duracao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo`
--

CREATE TABLE `grupo` (
  `CodGrupo` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Nome` varchar(20) NOT NULL,
  `CodCriador` bigint(20),
  `DataCriacao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `hierarquia`
--

CREATE TABLE `hierarquia` (
  `CodHierarquia` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Nome` varchar(30) NOT NULL,
  `Nivel` enum('adm','aluno','func') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `insignia`
--

CREATE TABLE `insignia` (
  `CodInsignia` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Descricao` text NOT NULL,
  `Link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `inteligencia`
--

CREATE TABLE `inteligencia` (
  `CodInteligencia` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Nome` varchar(20) NOT NULL,
  `Descricao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itemavatar`
--

CREATE TABLE `itemavatar` (
  `CodItem` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Descricao` text NOT NULL,
  `Link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `linkexterno`
--

CREATE TABLE `linkexterno` (
  `CodLink` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Descricao` text,
  `Link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagem`
--

CREATE TABLE `mensagem` (
  `CodMensagem` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `CodRemetente` bigint(20),
  `CodDestino` bigint(20),
  `CodGrupo` bigint(20),
  `DataHoraEnvio` datetime NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Imagem` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mural`
--

CREATE TABLE `mural` (
  `CodMural` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Nome` varchar(20) NOT NULL,
  `Descricao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificacao`
--

CREATE TABLE `notificacao` (
  `CodNotificacao` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Titulo` varchar (50) NOT NULL,
  `Texto` varchar(200) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '0',
  `DataHora` datetime NOT NULL,
  `Link` varchar(200) NOT NULL,
  `CodRemetente` bigint(20) NOT NULL,
  `CodDestinatario` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `opiniao`
--

CREATE TABLE `opiniao` (
  `CodOpiniao` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `CodPost` bigint(20) NOT NULL,
  `CodUsuario` bigint(20) NOT NULL,
  `CodTipoOpiniao` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `postagem`
--

CREATE TABLE `postagem` (
  `CodPost` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Conteudo` text NOT NULL,
  `DataHora` datetime NOT NULL,
  `Imagem` text,
  `CodMural` bigint(20) NOT NULL,
  `CodUsuario` bigint(20)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `resposta-campo`
--

CREATE TABLE `resposta-campo` (
  `CodResposta` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Resposta` longtext NOT NULL,
  `CodCampo` bigint(20) NOT NULL,
  `CodUsuario` bigint(20) DEFAULT NULL,
  `CodGrupo` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rostoavatar`
--

CREATE TABLE `rostoavatar` (
  `CodRosto` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Descricao` text NOT NULL,
  `Link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `roupaavatar`
--

CREATE TABLE `roupaavatar` (
  `CodRoupa` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Descricao` text NOT NULL,
  `Link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `task`
--

CREATE TABLE `task` (
  `CodTask` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Descricao` text NOT NULL,
  `QtdExperiencia` bigint(20) NOT NULL,
  `Prazo` datetime NOT NULL,
  `Realizada` enum('Individual','Grupo') NOT NULL,
  `CodCriador` bigint(20),
  `CodForm`bigint(20),
  `CodTipoTask` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipocampo`
--

CREATE TABLE `tipocampo` (
  `CodTipoCampo` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Nome` varchar(200) NOT NULL,
  `TipoCampo` enum('inputText','optionGroup','textArea','cxSelecao') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipoevento`
--

CREATE TABLE `tipoevento` (
  `CodTipoEvento` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Nome` varchar(10) NOT NULL,
  `Cor` varchar(7) NOT NULL,
  `Valor` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipoopiniao`
--

CREATE TABLE `tipoopiniao` (
  `CodTipoOpiniao` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Descricao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipotask`
--

CREATE TABLE `tipotask` (
  `CodTipoTask` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Nome` varchar(20) NOT NULL,
  `Premio` decimal(10,0) NOT NULL,
  `Dificuldade` enum('Bronze','Prata','Ouro','Platina') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipousuario`
--

CREATE TABLE `tipousuario` (
  `CodTipoUsuario` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Descricao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `CodTurma` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Modulo` int(11) NOT NULL,
  `NomeTurma` varchar(20) NOT NULL,
  `CodCurso` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `CodUsuario` bigint(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Email` varchar(100) NOT NULL,
  `Senha` varchar(255) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Sobrenome` varchar(50) NOT NULL,
  `Nickname` varchar(10) NOT NULL,
  `DataNascimento` date NOT NULL,
  `DataCadastro` date NOT NULL,
  `Sexo` enum('Fem','Masc') NOT NULL,
  `Cidade` varchar(50),
  `Status` tinyint(1) NOT NULL DEFAULT '0',
  `Online` tinyint(1) DEFAULT '0', 
  `Token` varchar(8) NOT NULL,
  `TokenPai` varchar(8),
  `QtdConsultorias` int(11) NOT NULL DEFAULT '0',
  `UltimoLogin` date,
  `CodTipoUsuario` int(11) NOT NULL,
  `CodAvatar` bigint(20) NOT NULL,
  `CodHierarquia` int(11)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario-equipe`
--

CREATE TABLE `usuario-equipe` (
  `CodUsuarioEquipe` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `CodUsuario` bigint(20) NOT NULL,
  `CodEquipe` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario-grupo`
--

CREATE TABLE `usuario-grupo` (
  `CodUsuarioGrupo` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `DataEntrada` date NOT NULL,
  `Admin` tinyint(1) NOT NULL DEFAULT '0',
  `CodUsuario` bigint(20) NOT NULL,
  `CodGrupo` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `aluno-turma`
--
ALTER TABLE `aluno-turma`
  ADD CONSTRAINT `fk-turma-usuario` FOREIGN KEY (`CodTurma`) REFERENCES `turma` (`CodTurma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-usuario-turma` FOREIGN KEY (`CodUsuario`) REFERENCES `usuario` (`CodUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `arquivo`
--
ALTER TABLE `arquivo`
  ADD CONSTRAINT `fk-usuarioenviou` FOREIGN KEY (`CodUsuario`) REFERENCES `usuario` (`CodUsuario`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limitadores para a tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `fk-avaliacao` FOREIGN KEY (`CodUsuario`) REFERENCES `usuario` (`CodUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-avaliado` FOREIGN KEY (`CodConsultor`) REFERENCES `usuario` (`CodUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `avatar`
--
ALTER TABLE `avatar`
  ADD CONSTRAINT `fk-cabeloavatar` FOREIGN KEY (`CodCabelo`) REFERENCES `cabeloavatar` (`CodCabelo`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-corpoavatar` FOREIGN KEY (`CodCorpo`) REFERENCES `corpoavatar` (`CodCorpo`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-item` FOREIGN KEY (`CodItem`) REFERENCES `itemavatar` (`CodItem`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-rosto` FOREIGN KEY (`CodRosto`) REFERENCES `rostoavatar` (`CodRosto`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-roupa` FOREIGN KEY (`CodRoupa`) REFERENCES `roupaavatar` (`CodRoupa`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limitadores para a tabela `campo`
--
ALTER TABLE `campo`
  ADD CONSTRAINT `fk-tipocampo` FOREIGN KEY (`CodTipoCampo`) REFERENCES `tipocampo` (`CodTipoCampo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `fk-postagem` FOREIGN KEY (`CodPostagem`) REFERENCES `postagem` (`CodPost`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-usuariocomentario` FOREIGN KEY (`CodUsuario`) REFERENCES `usuario` (`CodUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `compcurricular`
--
ALTER TABLE `compcurricular`
  ADD CONSTRAINT `fk-compcurricular-professor` FOREIGN KEY (`CodProfessor`) REFERENCES `usuario` (`CodUsuario`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `competencia`
--
ALTER TABLE `competencia`
  ADD CONSTRAINT `fk-inteligencia` FOREIGN KEY (`CodInteligencia`) REFERENCES `inteligencia` (`CodInteligencia`),
  ADD CONSTRAINT `fk-task` FOREIGN KEY (`CodTask`) REFERENCES `task` (`CodTask`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `componente-curso`
--
ALTER TABLE `componente-curso`
  ADD CONSTRAINT `fk-componente-curso` FOREIGN KEY (`CodComponente`) REFERENCES `compcurricular` (`CodComponente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-curso-componente` FOREIGN KEY (`CodCurso`) REFERENCES `curso` (`CodCurso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `conquista`
--
ALTER TABLE `conquista`
  ADD CONSTRAINT `fk-insignia` FOREIGN KEY (`CodInsignia`) REFERENCES `insignia` (`CodInsignia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-usuarioconquista` FOREIGN KEY (`CodUsuario`) REFERENCES `usuario` (`CodUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `consultoria`
--
ALTER TABLE `consultoria`
  ADD CONSTRAINT `fk-consultor` FOREIGN KEY (`CodConsultor`) REFERENCES `usuario` (`CodUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-duvida` FOREIGN KEY (`CodDuvida`) REFERENCES `duvida` (`CodDuvida`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `desempenha-task`
--
ALTER TABLE `desempenha-task`
  ADD CONSTRAINT `fk-taskdesempenhada` FOREIGN KEY (`CodTask`) REFERENCES `task` (`CodTask`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-usuariodesempenhou` FOREIGN KEY (`CodUsuario`) REFERENCES `usuario` (`CodUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `duvida`
--
ALTER TABLE `duvida`
  ADD CONSTRAINT `fk-compcurricular-duvida` FOREIGN KEY (`CodCompCurricular`) REFERENCES `compcurricular` (`CodComponente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-criadorduvida` FOREIGN KEY (`CodCriador`) REFERENCES `usuario` (`CodUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `equipe`
--
ALTER TABLE `equipe`
  ADD CONSTRAINT `fk-equipetask` FOREIGN KEY (`CodTask`) REFERENCES `task` (`CodTask`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `fk-criadorevento` FOREIGN KEY (`CriadoPor`) REFERENCES `usuario` (`CodUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-tipoevento` FOREIGN KEY (`CodTipoEvento`) REFERENCES `tipoevento` (`CodTipoEvento`);

--
-- Limitadores para a tabela `experiencia`
--
ALTER TABLE `experiencia`
  ADD CONSTRAINT `fk-xp` FOREIGN KEY (`CodUsuario`) REFERENCES `usuario` (`CodUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `form-campo`
--
ALTER TABLE `form-campo`
  ADD CONSTRAINT `fk-campoform` FOREIGN KEY (`CodCampo`) REFERENCES `campo` (`CodCampo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-formcampo` FOREIGN KEY (`CodForm`) REFERENCES `formulario` (`CodForm`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `fk-criadorgrupo` FOREIGN KEY (`CodCriador`) REFERENCES `usuario` (`CodUsuario`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limitadores para a tabela `mensagem`
--
ALTER TABLE `mensagem`
  ADD CONSTRAINT `fk-destinomsg` FOREIGN KEY (`CodDestino`) REFERENCES `usuario` (`CodUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-grupomsg` FOREIGN KEY (`CodGrupo`) REFERENCES `grupo` (`CodGrupo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-remetentemsg` FOREIGN KEY (`CodRemetente`) REFERENCES `usuario` (`CodUsuario`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limitadores para a tabela `notificacao`
--
ALTER TABLE `notificacao`
  ADD CONSTRAINT `fk-destinatarionotificacao` FOREIGN KEY (`CodDestinatario`) REFERENCES `usuario` (`CodUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-remetentenotificacao` FOREIGN KEY (`CodRemetente`) REFERENCES `usuario` (`CodUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `opiniao`
--
ALTER TABLE `opiniao`
  ADD CONSTRAINT `fk-post` FOREIGN KEY (`CodPost`) REFERENCES `postagem` (`CodPost`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-tipoopiniao` FOREIGN KEY (`CodTipoOpiniao`) REFERENCES `tipoopiniao` (`CodTipoOpiniao`),
  ADD CONSTRAINT `fk-usuario` FOREIGN KEY (`CodUsuario`) REFERENCES `usuario` (`CodUsuario`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Limitadores para a tabela `postagem`
--
ALTER TABLE `postagem`
  ADD CONSTRAINT `fk-criadorpost` FOREIGN KEY (`CodUsuario`) REFERENCES `usuario` (`CodUsuario`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-mural` FOREIGN KEY (`CodMural`) REFERENCES `mural` (`CodMural`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `resposta-campo`
--
ALTER TABLE `resposta-campo`
  ADD CONSTRAINT `fk-responderamcampo` FOREIGN KEY (`CodGrupo`) REFERENCES `equipe` (`CodEquipe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-respondeucampo` FOREIGN KEY (`CodUsuario`) REFERENCES `usuario` (`CodUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-respostacampo` FOREIGN KEY (`CodCampo`) REFERENCES `campo` (`CodCampo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `fk-criadortask` FOREIGN KEY (`CodCriador`) REFERENCES `usuario` (`CodUsuario`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-formulario` FOREIGN KEY (`CodForm`) REFERENCES `formulario` (`CodForm`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-tipotask` FOREIGN KEY (`CodTipoTask`) REFERENCES `tipotask` (`CodTipoTask`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `fk-turma-curso` FOREIGN KEY (`CodCurso`) REFERENCES `curso` (`CodCurso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk-avatar` FOREIGN KEY (`CodAvatar`) REFERENCES `avatar` (`CodAvatar`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-hierarquia` FOREIGN KEY (`CodHierarquia`) REFERENCES `hierarquia` (`CodHierarquia`),
  ADD CONSTRAINT `fk-tipousuario` FOREIGN KEY (`CodTipoUsuario`) REFERENCES `tipousuario` (`CodTipoUsuario`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `usuario-equipe`
--
ALTER TABLE `usuario-equipe`
  ADD CONSTRAINT `fk-equipeusuario` FOREIGN KEY (`CodEquipe`) REFERENCES `equipe` (`CodEquipe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-usuarioequipe` FOREIGN KEY (`CodUsuario`) REFERENCES `usuario` (`CodUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
