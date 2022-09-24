<?php
require "bnc.php";
$pdo = Bnc::conectar();
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$json = filter_input(INPUT_GET, 'json');

$data = json_decode($json, true);
$op = $data['op'];
$procodigo = $data['procodigo'];
$pronome = $data['pronome'];
$proeixo = $data['proeixo'];

if ($op == 'i') {
    $sql = "insert into projetos(pronome, proeixo)values(?,?);";
    $prp = $pdo->prepare($sql);
    $prp->execute(array($pronome, $proeixo));
    Bnc::desconectar();
} else if ($op == 'u') {
    $sql = "update projetos set pronome=?, proeixo=? where procodigo=?;";
    $prp = $pdo->prepare($sql);
    $prp->execute(array($pronome, $proeixo, $procodigo));
    Bnc::desconectar();
} else if ($op == 'd') {
    $sql = "delete from projetos where procodigo=?;";
    $prp = $pdo->prepare($sql);
    $prp->execute(array($procodigo));
    Bnc::desconectar();
} else if ($op == 's') {
    $sql = "select * from projetos where pronome like '%$pronome%';";
    $prp = $pdo->prepare($sql);
    $prp->execute();
    $data = $prp->fetchall(PDO::FETCH_ASSOC);
    echo json_encode($data);
    Bnc::desconectar();
} else {
}
