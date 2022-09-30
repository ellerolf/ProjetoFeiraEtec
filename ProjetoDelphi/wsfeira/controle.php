<?php
require "bnc.php";
$pdo = Bnc::conectar();
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$json = filter_input(INPUT_GET, 'json');

$data = json_decode($json, true);
$op = $data['op'];
$concodigo = $data['concodigo'];
$codigousu = $data['codigousu'];
$proj1 = $data['proj1'];
$proj2 = $data['proj2'];
$proj3 = $data['proj3'];
$proj4 = $data['proj4'];

if ($op == 'i') {
    $sql = "insert into controle(codigousu, proj1, proj2, proj3, proj4)values(?,?,?,?,?);";
    $prp = $pdo->prepare($sql);
    $prp->execute(array($codigousu, $proj1, $proj2, $proj3, $proj4));
    Bnc::desconectar();
} else if ($op == 'u') {
    $sql = "update controle set codigousu=?, proj1=?, proj2=?, proj3=?, proj4=? where concodigo=?;";
    $prp = $pdo->prepare($sql);
    $prp->execute(array($codigousu, $proj1, $proj2, $proj3, $proj4, $concodigo));
    Bnc::desconectar();
} else if ($op == 'd') {
    $sql = "delete from controle where concodigo=?;";
    $prp = $pdo->prepare($sql);
    $prp->execute(array($concodigo));
    Bnc::desconectar();
} else if ($op == 's') {
    $sql = "select * from vcontrole where CODIGOUSU=$codigousu;";
    $prp = $pdo->prepare($sql);
    $prp->execute();
    $data = $prp->fetchall(PDO::FETCH_ASSOC);
    echo json_encode($data);
    Bnc::desconectar();
} else {
}
