<?php
defined('_PUBLIC_ACCESS') or die();

$table = 'tb_compras';
$seccion = 'compras';
$titulo = 'Compras';

//Consulta en index

// Para el editor
$titulo_editor = 'Agregar/Editar Compra';
$id = (isset($_GET['id']) && $_GET['id'] > 0) ? $_GET['id'] : 0;


$proveedores = $db->select('tb_proveedores', array(
    'id' => 'id',
    'nombre' => 'Proveedor'
), array('Estatus = 1'));


$ingredientes = $db->select('tb_ingredientes', array(
    'id' => 'id',
    'nombre' => 'Ingrediente'
), array('Estatus = 1'));

$ingredientes_indexed = array();
foreach($ingredientes as $r){
    $ingredientes_indexed[$r['id']] = $r['nombre'];
}

$unidades = $db->select('tb_unidades', array(
    'id' => 'id',
    'nombre' => "CONCAT(Unidad,' (',IFNULL(Abreviacion,''),')')"
), array('Estatus = 1'));

$unidades_indexed = array();
foreach($unidades as $r){
    $unidades_indexed[$r['id']] = $r['nombre'];
}