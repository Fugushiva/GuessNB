//déclaration des variables pour le jeu
const divMessage = document.getElementById("message");
let userGuessId = document.getElementById("nb");
let NBtoGuess = document.getElementById("ADeviner");
const checkNB = document.getElementById("checkNB");
let ParaChance = document.getElementById("chance");
let restartButton = document.getElementById("refresh");
let secretLink = document.getElementById("secret");
let changeNameButton = document.getElementById("changeName");
let phpFunc = "<?php changeName(); ?>";

const MAX = 9;
const MIN = 0;
chance = parseInt(ParaChance.innerHTML);

//génere nb aléatoire
nbRandom = Math.floor(Math.random() * 10);
//affichage nb aléatoire pour les tests
NBtoGuess.innerHTML = nbRandom;

//cache bouton reset & lien secret
restartButton.style.display = "none";
secretLink.style.display = "none";

checkNB.onclick = function () {
  let userGuess = parseInt(document.getElementById("nb").value);

  if (parseInt(userGuess) == nbRandom) {
    //condition de victoire
    chance--;
    ParaChance.innerHTML = chance;
    divMessage.style.backgroundColor = "green";
    divMessage.style.fontSize = "20pt";
    divMessage.innerHTML = `Bravo tu as trouvé le chiffre !`;
    checkNB.style.display = "none";
    restartButton.style.display = "";
    secretLink.style.display = "";
  }
  if (chance == 1) {
    //condition si plus de chance
    //affiche bouton display et cache bouton de jeu
    checkNB.style.display = "none";
    restartButton.style.display = "";
  }
  if (userGuess != nbRandom) {
    //condition de défaite
    chance--;
    ParaChance.innerHTML = chance;
    divMessage.style.backgroundColor = "red";
    divMessage.style.fontSize = "20pt";
    divMessage.innerHTML =
      "Désolé ce n'est pas le chiffre recherché, recommence";
  }
  if (userGuess < MIN || userGuess > MAX) {
    divMessage.style.backgroundColor = "blue";
    divMessage.style.fontSize = "20pt";
    divMessage.innerHTML = `doit être entre ${MIN} et ${MAX}`;
  }
};

restartButton.onclick = function () {
  window.location.reload();
};

changeNameButton.onclick = function () {
  document.write(phpFunc);
};

//déclaration de variable pour la date

let date = new Date();

date = date.toLocaleDateString("fr-BE", {
  weekday: "long",
  day: "numeric",
  month: "long",
  year: "numeric",
  hour: "numeric",
});

let h3Date = document.getElementById("date");

h3Date.innerHTML = date;
