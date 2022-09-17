<?php
require "bnc.php";
$pdo = Bnc::conectar();
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$json = filter_input(INPUT_GET, 'json');

$data = json_decode($json, true);
$op = $data['op'];
$eixcodigo = $data['eixcodigo'];
$eixonome = $data['eixonome'];

if ($op == 'i') {
    $sql = "insert into eixos(eixonome)values(?);";
    $prp = $pdo->prepare($sql);
    $prp->execute(array($eixonome));
    Bnc::desconectar();
} else if ($op == 'u') {
    $sql = "update eixos set eixonome=?where eixcodigo=?;";
    $prp = $pdo->prepare($sql);
    $prp->execute(array($eixonome, $eixcodigo));
    Bnc::desconectar();
} else if ($op == 'd') {
    $sql = "delete from eixos where eixcodigo=?;";
    $prp = $pdo->prepare($sql);
    $prp->execute(array($eixcodigo));
    Bnc::desconectar();
} else if ($op == 's') {
    $sql = "select * from eixos where eixonome like '%$eixonome%';";
    $prp = $pdo->prepare($sql);
    $prp->execute();
    $data = $prp->fetchall(PDO::FETCH_ASSOC);
    echo json_encode($data);
    Bnc::desconectar();
} else {
}