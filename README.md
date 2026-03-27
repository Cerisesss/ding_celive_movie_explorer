# Movie Explorer

Projet Flutter

## Prérequis
- Installer Flutter SDK
- Android Studio ou Visual Studio Code avec les plugins Flutter et Dart 
avec les plugins Flutter et Dart

## Installation
- Cloner le projet : git clone <projet>
- Se deplacer dans le répertoire du projet
- Utiliser la commande **flutter pub get** pour installer les dépendances

## Configuration de l’environnement
- Créez un fichier **.env** à la racine du projet
- Copiez le contenu de **.env.example** dans le fichier **.env**
- Remplacez la valeur du **API_KEY** par votre propre **clé api** (voir doc utile)

## Lancer le projet
- Tapez **flutter run** puis selectionner le navigateur souhaité ou **flutter run -d web-server** puis ouvrez manuellement **http://localhost:PORT** dans votre navigateur

## DOC utile :
  - API key : https://developer.themoviedb.org/docs/getting-started
  - API : https://developer.themoviedb.org/reference/movie-images
  - .env : https://medium.com/@matteo.dcj/using-environment-variables-with-flutter-dotenv-and-dotenv-in-flutter-step-by-step-guide-709ac93e8ec2
  - API TMDB Image : https://developer.themoviedb.org/docs/image-basics
  - Barre de recherche : https://api.flutter.dev/flutter/material/SearchBar-class.html