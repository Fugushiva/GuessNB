[1mdiff --git a/devine.php b/devine.php[m
[1mindex 69ff874..e949a9d 100644[m
[1m--- a/devine.php[m
[1m+++ b/devine.php[m
[36m@@ -9,23 +9,63 @@[m
 </head>[m
 [m
 <body>[m
[31m-    <?php[m
[31m-     date_default_timezone_set("Europe/Brussels");[m
[31m-        $today = date(" l d/m/Y");[m
[31m-       [m
[31m-    ?>[m
[32m+[m[32m    <?php[m[41m [m
[32m+[m[32m        $surname;[m
[32m+[m[41m     [m
[32m+[m[32m    ?>[m[41m    [m
[32m+[m
     <h1>devine le chiffre</h1>[m
     <h3 id="date"></h3>[m
[31m-[m
     <p id="message"></p>[m
[32m+[m[32m    <?php[m[41m [m
[32m+[m[32m        if(!isset($_POST["prenom"])){?>[m
[32m+[m[32m    <form action="devine.php" method ="post">[m
[32m+[m[32m    <label for="prenom" name="prenom">Votre prenom</label>[m
[32m+[m[32m    <input type="text" id="prenom" name="prenom">[m
[32m+[m[41m    [m
[32m+[m[32m    <input type="submit">[m
[32m+[m[41m [m
[32m+[m[32m    </form>[m
[32m+[m
[32m+[m[32m    <?php }else  {?>[m
[32m+[m[41m     [m
[32m+[m[32m          <button id="changeName">changer de nom ne fonctionne pas encore</button>[m
[32m+[m[41m    [m
[32m+[m[32m    <?php }?>[m
[32m+[m
[32m+[m[32m    <?php[m
[32m+[m[32m        if(isset($_POST["prenom"])){[m
[32m+[m[32m            $surname = $_POST["prenom"];[m
[32m+[m[32m           echo "<p>Bonjour " . $_POST["prenom"] .", tu as 3 chances pour deviner le nombre, bon courage</p>";[m
[32m+[m[32m        }[m
[32m+[m[41m        [m
[32m+[m[32m    ?>[m
[32m+[m
[32m+[m
[32m+[m[32m<?php[m[41m [m
[32m+[m[32m       function changeName(){[m
[32m+[m[32m        $surname="";[m
[32m+[m[32m    }[m
[32m+[m[32m?>[m
[32m+[m[41m   [m
[32m+[m[32m    <?php[m[41m [m
[32m+[m[32m        if(!empty($_POST["prenom"])){ ?>[m
     <label name="id" for="nb">Entrez votre nombre</label>[m
     <input type="number" id="nb"></input>[m
     <p id="chance">3</p>[m
     <p id="ADeviner"></p>[m
     <button id="checkNB">vérifier le nombre</button>[m
     <button id="refresh">reenitialiser</button>[m
[32m+[m[32m    <form action="secret.php" method ="get" id="secret">[m
[32m+[m[32m    <input type="text" id="prenomGET" name="prenom" readonly value="<?=$surname ?>">[m
[32m+[m[32m    <input type="submit" class="boutton">[m
[32m+[m[32m    </form>[m
[32m+[m[32m    <?php } ?>[m
[32m+[m
[32m+[m
 [m
     <script src="./script/script.js"></script>[m
[32m+[m[41m   [m
 </body>[m
 [m
 [m
[1mdiff --git a/script/script.js b/script/script.js[m
[1mindex 889690b..7fe427e 100644[m
[1m--- a/script/script.js[m
[1m+++ b/script/script.js[m
[36m@@ -3,17 +3,25 @@[m [mconst divMessage = document.getElementById("message");[m
 let userGuessId = document.getElementById("nb");[m
 let NBtoGuess = document.getElementById("ADeviner");[m
 const checkNB = document.getElementById("checkNB");[m
[31m-const MAX = 10;[m
 let ParaChance = document.getElementById("chance");[m
 let restartButton = document.getElementById("refresh");[m
[32m+[m[32mlet secretLink = document.getElementById("secret");[m
[32m+[m[32mlet changeNameButton = document.getElementById("changeName");[m
[32m+[m[32mlet phpFunc = "<?php changeName(); ?>";[m
[32m+[m
[32m+[m[32mconst MAX = 9;[m
[32m+[m[32mconst MIN = 0;[m
 chance = parseInt(ParaChance.innerHTML);[m
 [m
 //génere nb aléatoire[m
 nbRandom = Math.floor(Math.random() * 10);[m
[32m+[m[32m//affichage nb aléatoire pour les tests[m
 NBtoGuess.innerHTML = nbRandom;[m
[32m+[m
[32m+[m[32m//cache bouton reset & lien secret[m
 restartButton.style.display = "none";[m
[32m+[m[32msecretLink.style.display = "none";[m
 [m
[31m-//[m
 checkNB.onclick = function () {[m
   let userGuess = parseInt(document.getElementById("nb").value);[m
 [m
[36m@@ -23,11 +31,14 @@[m [mcheckNB.onclick = function () {[m
     ParaChance.innerHTML = chance;[m
     divMessage.style.backgroundColor = "green";[m
     divMessage.style.fontSize = "20pt";[m
[31m-    divMessage.innerHTML = `Bravo tu as trouvé le chiffre ! c'était bel et bien ${nbRandom}`;[m
[32m+[m[32m    divMessage.innerHTML = `Bravo tu as trouvé le chiffre !`;[m
     checkNB.style.display = "none";[m
     restartButton.style.display = "";[m
[32m+[m[32m    secretLink.style.display = "";[m
   }[m
   if (chance == 1) {[m
[32m+[m[32m    //condition si plus de chance[m
[32m+[m[32m    //affiche bouton display et cache bouton de jeu[m
     checkNB.style.display = "none";[m
     restartButton.style.display = "";[m
   }[m
[36m@@ -40,12 +51,21 @@[m [mcheckNB.onclick = function () {[m
     divMessage.innerHTML =[m
       "Désolé ce n'est pas le chiffre recherché, recommence";[m
   }[m
[32m+[m[32m  if (userGuess < MIN || userGuess > MAX) {[m
[32m+[m[32m    divMessage.style.backgroundColor = "blue";[m
[32m+[m[32m    divMessage.style.fontSize = "20pt";[m
[32m+[m[32m    divMessage.innerHTML = `doit être entre ${MIN} et ${MAX}`;[m
[32m+[m[32m  }[m
 };[m
 [m
 restartButton.onclick = function () {[m
   window.location.reload();[m
 };[m
 [m
[32m+[m[32mchangeNameButton.onclick = function () {[m
[32m+[m[32m  document.write(phpFunc);[m
[32m+[m[32m};[m
[32m+[m
 //déclaration de variable pour la date[m
 [m
 let date = new Date();[m
[1mdiff --git a/style/style.css b/style/style.css[m
[1mindex 2258e07..bc1f66d 100644[m
[1m--- a/style/style.css[m
[1m+++ b/style/style.css[m
[36m@@ -10,3 +10,12 @@[m [mh3 {[m
 input:focus {[m
   background-color: lightgrey;[m
 }[m
[32m+[m
[32m+[m[32m#prenomGet {[m
[32m+[m[32m  visibility: hidden;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.boutton {[m
[32m+[m[32m  margin-right: 180px;[m
[32m+[m[32m  margin-top: 50px;[m
[32m+[m[32m}[m
