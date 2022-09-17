<?php
require "bnc.php";
$pdo = Bnc::conectar();
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$json = filter_input(INPUT_GET, 'json');

$data = json_decode($json, true);
$op = $data['op'];
$usucodigo = $data['usucodigo'];
$usucpf = $data['usucpf'];
$usunome = $data['usunome'];
$usudtnasc = $data['usudtnasc'];
$usutipo = $data['usutipo'];

if ($op == 'i') {
    $sql = "insert into usuarios(usucpf, usunome, usudtnasc, usutipo)values(?,?,?,?);";
    $prp = $pdo->prepare($sql);
    $prp->execute(array($usucpf, $usunome, $usudtnasc, $usutipo));
    Bnc::desconectar();
} else if ($op == 'u') {
    $sql = "update usuarios set usucpf=?, usunome=?, usudtnasc=?, usutipo=? where usucodigo=?;";
    $prp = $pdo->prepare($sql);
    $prp->execute(array($usucpf, $usunome, $usudtnasc, $usutipo, $usucodigo));
    Bnc::desconectar();
} else if ($op == 'd') {
    $sql = "delete from usuarios where usucodigo=?;";
    $prp = $pdo->prepare($sql);
    $prp->execute(array($usucodigo));
    Bnc::desconectar();
} else if ($op == 's') {
    $sql = "select * from usuarios where usunome like '%$usunome%';";
    $prp = $pdo->prepare($sql);
    $prp->execute();
    $data = $prp->fetchall(PDO::FETCH_ASSOC);
    echo json_encode($data);
    Bnc::desconectar();
} else {
}
