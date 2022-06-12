<?php
session_start();

include("db.php");

class data extends db{
    private $bookpic;
    private $bookname;
    private $bookdetail;
    private $bookaudor;
    private $bookpub;
    private $branch;
    private $bookprice;
    private $bookquantity;
    private $type;

    private $book;
    private $userselect;
    private $days;
    private $getdate;
    private $returnDate;

    function __construct()
    {
        //echo "working";
    }
    function authoritylogin($t1,$t2){
  $q="SELECT*FROM authority where email='$t1' and pass='$t2'";

  $recordSet=$this->connection->query($q);
  $result=$recordSet->rowCount();

  if($result>0){
    foreach($recordSet->fetchAll() as $row) {
        $logid=$row['id'];
        $_SESSION["authorityid"]=$logid;
    header("Location:authority_service_dashboard.php");
    }
  }
  elseif($result<=0){
    header("Location:index1.php?msg=Invalid Credentials"); 
  }
    }
    function addnewuser($addname,$addpass,$addemail,$type){
        
    }
}