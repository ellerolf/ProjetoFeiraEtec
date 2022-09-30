<?php
require "bnc.php";
$pdo = Bnc::conectar();
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$json = filter_input(INPUT_GET, 'json');
	
$data = json_decode($json, true);
$op = $data['op'];
$alucodigo = $data['alucodigo'];
$alunnome = $data['alunnome'];
$codigopro = $data['codigopro'];

if ($op == 'i') {
    $sql = "insert into alunos(alunnome, codigopro)values(?,?);";
    $prp = $pdo->prepare($sql);
    $prp->execute(array($alunnome, $codigopro));
    Bnc::desconectar();
} else if ($op == 'u') {
    $sql = "update alunos set alunnome=?, codigopro=? where alucodigo=?;";
    $prp = $pdo->prepare($sql);
    $prp->execute(array($alunnome, $codigopro, $alucodigo));
    Bnc::desconectar();
} else if ($op == 'd') {
    $sql = "delete from alunos where alucodigo=?;";
    $prp = $pdo->prepare($sql);
    $prp->execute(array($alucodigo));
    Bnc::desconectar();
} else if ($op == 's') {
    $sql = "select * from alunos where alunnome like '%$alunnome%';";
    $prp = $pdo->prepare($sql);
    $prp->execute();
    $data = $prp->fetchall(PDO::FETCH_ASSOC);
    echo json_encode($data);
    Bnc::desconectar();
} else {
}
