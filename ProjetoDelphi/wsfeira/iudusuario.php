<?php
//Part 3
require "bnc.php";
$pdo = Bnc::conectar();
$pdo ->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$json = filter_input(INPUT_GET,'json');

$data = json_decode($json,true);
$op = $data['op'];
$usucod = $data["usucod"];
$usunome = $data["usunome"];
$usuuser = $data["usuuser"];
$usupass =  $data["usupass"];
$usuativo = $data["usuativo"];

if($op == 'i'){
    $sql = "insert into usuarios (usunome,usuuser,usupass)values(?,?,MD5(?));";
    $prp = $pdo->prepare($sql);
    $prp->execute(array($usunome,$usuuser,$usupass));
    Bnc::desconectar();

    echo "gravou";
}
else if($op == 'u'){
    $sql = "update usuarios set usunome=?,usuuser=?,usupass=MD5(?),usuativo=? where usucod=?;";
    $prp = $pdo->prepare($sql);
    $prp->execute(array($usunome,$usuuser,$usupass,$usuativo,$usucod));
    Bnc::desconectar();

    echo "Alterado";

}else if($op == 'd'){
    $sql = "delete from usuarios where usucod=?;";
    $prp = $pdo->prepare($sql);
    $prp->execute(array($usucod));
    Bnc::desconectar();

    echo "Deletado";
}else{
    echo "escolha uma das outras opções";
}


/*'{"op":"u","usucod":7,"usunome": "MARCO COELHO VELHO","usuuser": "COELHO","usupass": "1234","usuativo":0}';
{"op":"u","usucod":7}

*/
