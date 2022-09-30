<?php
//Part 4
require "bnc.php";
$pdo = Bnc::conectar();
$pdo ->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

if(empty($_POST)){
    $nome = filter_input(INPUT_GET,'nome',FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $ativo = filter_input(INPUT_GET,'ativo',FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $sql = "select * from usuarios where usuuser = $nome and usupass = $usupass and usuativo = 1;";
    $prp = $pdo->prepare($sql);
    $prp->execute();
    $data = $prp->fetchall(PDO::FETCH_ASSOC);
    echo json_encode($data);
    Bnc::desconectar();

    echo "aqui";
}