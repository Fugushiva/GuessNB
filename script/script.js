//déclaration des variables pour le jeu
const divMessage = document.getElementById("message");
let userGuessId = document.getElementById("nb");
let NBtoGuess = document.getElementById("ADeviner");
const checkNB = document.getElementById("checkNB");
const MAX = 10;
let ParaChance = document.getElementById("chance");
let restartButton = document.getElementById("refresh");
chance = parseInt(ParaChance.innerHTML);

//génere nb aléatoire
nbRandom = Math.floor(Math.random() * 10);
NBtoGuess.innerHTML = nbRandom;
restartButton.style.display = "none";

//
checkNB.onclick = function () {
  let userGuess = parseInt(document.getElementById("nb").value);

  if (parseInt(userGuess) == nbRandom) {
    //condition de victoire
    chance--;
    ParaChance.innerHTML = chance;
    divMessage.style.backgroundColor = "green";
    divMessage.style.fontSize = "20pt";
    divMessage.innerHTML = `Bravo tu as trouvé le chiffre ! c'était bel et bien ${nbRandom}`;
    checkNB.style.display = "none";
    restartButton.style.display = "";
  }
  if (chance == 1) {
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
};

restartButton.onclick = function () {
  window.location.reload();
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
