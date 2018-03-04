<?php
header("Content-Type:application/json");
require('../init.php');
$arr=[];//封面，第一页，第二页，第三页，封底
$sql="select floor,kw,generalize from index_recommend where floor=1 and generalize is not null order by generalize";
$result=mysqli_query($conn,$sql);
$generalize=mysqli_fetch_all($result,1);
$arr['generalize']=$generalize;
$sql="select floor,pic from index_recommend  where floor=1 and cover is not null order by cover desc";
$result=mysqli_query($conn,$sql);
$cover=mysqli_fetch_all($result,1)[0];
$arr['cover']=$cover;
$sql="select floor,kw,remark,pic,hot from index_recommend  where floor=1 and hot is not null order by hot";
$result=mysqli_query($conn,$sql);
$hot=(mysqli_fetch_all($result,1));
$arr['hot']=$hot;
$sql="select floor,title,details,pic,price,href,import from index_recommend  where floor=1 and import is not null order by import";
$result=mysqli_query($conn,$sql);
$import=mysqli_fetch_all($result,1);
$arr['import']=$import;
$sql="select floor,title,details,pic,price,href,domestic from index_recommend  where floor=1 and domestic is not null order by domestic";
$result=mysqli_query($conn,$sql);
$domestic=mysqli_fetch_all($result,1);
$arr['domestic']=$domestic;
$sql="select floor,pic from index_recommend  where floor=1 and icons is not null order by icons";
$result=mysqli_query($conn,$sql);
$icons=mysqli_fetch_all($result,1);
$arr['icons']=$icons;
echo json_encode($arr);