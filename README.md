# PushToTalk

Application PTT pour Rainbow (Alcatel-Lucent Enterpris)


## Technologies

Flutter (Dart) avec Java pour l'utilisation du SDK Rainbow officiel.

--> Mise en place nécessaire d'un "pont de liaison" entre Dart et Java :

- Dart envoie un appel au Java
- Java appelle le SDK Rainbow et renvoie les informations au Dart
- Dart récupère et met à jour les vues

## Liens

[SDK Rainbow Java](https://developers.openrainbow.com/doc/sdk/android/home)

[Platform Channels](https://docs.flutter.dev/platform-integration/platform-channels?tab=android-channel-java-tab)