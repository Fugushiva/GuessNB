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
     date_default_timezone_set("Europe/Brussels");
        $today = date(" l d/m/Y");
       
    ?>
    <h1>devine le chiffre</h1>
    <h3 id="date"></h3>

    <p id="message"></p>
    <label name="id" for="nb">Entrez votre nombre</label>
    <input type="number" id="nb"></input>
    <p id="chance">3</p>
    <p id="ADeviner"></p>
    <button id="checkNB">vérifier le nombre</button>
    <button id="refresh">reenitialiser</button>

    <script src="./script/script.js"></script>
</body>



</html>