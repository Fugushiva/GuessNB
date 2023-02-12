<!DOCTYPE htmml>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="author" content="Jérôme Delodder">
    <link rel="stylesheet" href="style/style.css">
    <title>Devine le chiffre </title>
</head>

<body>
    <?php 
        $surname;
     
    ?>    

    <h1>devine le chiffre</h1>
    <h3 id="date"></h3>
    <p id="message"></p>
    <?php 
        if(!isset($_POST["prenom"])){?>
    <form action="devine.php" method ="post">
    <label for="prenom" name="prenom">Votre prenom</label>
    <input type="text" id="prenom" name="prenom">
    
    <input type="submit">
 
    </form>

    <?php }else  {?>
     
          <button id="changeName">changer de nom ne fonctionne pas encore</button>
    
    <?php }?>

    <?php
        if(isset($_POST["prenom"])){
            $surname = $_POST["prenom"];
           echo "<p>Bonjour " . $_POST["prenom"] .", tu as 3 chances pour deviner le nombre, bon courage</p>";
        }
        
    ?>


<?php 
       function changeName(){
        $surname="";
    }
?>
   
    <?php 
        if(!empty($_POST["prenom"])){ ?>
    <label name="id" for="nb">Entrez votre nombre</label>
    <input type="number" id="nb"></input>
    <p id="chance">3</p>
    <p id="ADeviner"></p>
    <button id="checkNB">vérifier le nombre</button>
    <button id="refresh">reenitialiser</button>
    <form action="secret.php" method ="get" id="secret">
    <input type="text" id="prenomGET" name="prenom" readonly value="<?=$surname ?>">
    <input type="submit" class="boutton">
    </form>
    <?php } ?>



    <script src="./script/script.js"></script>
   
</body>



</html>