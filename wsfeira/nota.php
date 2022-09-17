<?php
require "bnc.php";
$pdo = Bnc::conectar();
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$json = filter_input(INPUT_GET, 'json');

$data = json_decode($json, true);
$op = $data['op'];
$notcodigo = $data['notcodigo'];
$codigoalu = $data['codigoalu'];
$notaind = $data['notaind'];
$notagrp = $data['notagrp'];

if ($op == 'i') {
    $sql = "insert into notas(codigoalu, notaind, notagrp)values(?,?,?);";
    $prp = $pdo->prepare($sql);
    $prp->execute(array($codigoalu, $notaind, $notagrp));
    Bnc::desconectar();
} else if ($op == 'u') {
    $sql = "update notas set codigoalu=?, notaind=?, notagrp=?  where notcodigo=?;";
    $prp = $pdo->prepare($sql);
    $prp->execute(array($codigoalu, $notaind, $notagrp, $notcodigo));
    Bnc::desconectar();
} else if ($op == 'd') {
    $sql = "delete from notas where notcodigo=?;";
    $prp = $pdo->prepare($sql);
    $prp->execute(array($notcodigo));
    Bnc::desconectar();
} else if ($op == 's') {
    $sql = "select * from vnotas;";
    $prp = $pdo->prepare($sql);
    $prp->execute();
    $data = $prp->fetchall(PDO::FETCH_ASSOC);
    echo json_encode($data);
    Bnc::desconectar();
} else {
}
