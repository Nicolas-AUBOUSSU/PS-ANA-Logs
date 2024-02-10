# PS-ANA-Logs

FR : Lancer le script : « Installation__Configuration.ps1 »
Ce script permet de choisir le chemin ou est stocké l'application, que ce soit en local ou en réseau, pour une utilisation multiposte.

Ensuite, l'utilisateur a la possibilité de personnaliser l'interface en spécifiant le nom, la couleur, le logo, et l'icône de l'application.

Une fois ces paramètres configurés, le script crée le fichier pour lancer l'application, nommé "_lanceur.bat". Pour le déploiement, il suffit de créer une GPO (stratégie de groupe) qui crée un raccourci pointant vers le fichier "_lanceur.bat".

Le logiciel centralise et génère des journaux pour tous les scripts lancés à partir de cette interface. Cela offre un historique détaillé des actions effectuées sur les postes et serveurs.

Le contenu du script, le résultat des opérations, ainsi que toutes les saisies effectuées dans la fenêtre PowerShell, sont enregistrés jusqu'à la fermeture de celle-ci.

Il est également possible de lancer l'édition du code, permettant ainsi d'ouvrir le script dans l'éditeur de notre choix et de créer une copie de sauvegarde avant toute modification.

Pour faciliter la recherche des journaux, ces derniers sont référencés dans un fichier XLSX, ce qui permet d'effectuer des recherches rapides par ordinateur, script, date, ...

À noter que j'ai utilisé Visual Studio Code avec GitHub Copilot pour le développement Je suis à la Version 0.9. J'ai effectué des tests personnels, et j'attends vos retours pour corriger d'éventuels problèmes avant de passer à la Version 1.

Je suis également ouvert à toutes suggestions supplémentaires que vous pourriez avoir.


_______________________________________________________________________________________________

EN : Run the script : "Installation__Configuration.ps1"
This script allows you to choose the path where the application is stored, whether it's locally or on the network, for multi-user use.

Afterward, the user has the option to customize the interface by specifying the name, color, logo, and icon of the application.

Once these settings are configured, the script creates the file to launch the application, named "_launcher.bat". For deployment, simply create a GPO (Group Policy Object) that creates a shortcut pointing to the "_launcher.bat" file.

The software centralizes and generates logs for all scripts launched from this interface. This provides a detailed history of actions performed on computers and servers.

The script records the content, operation results, and all inputs made in the PowerShell window until it is closed.

There is also the option to launch code editing, allowing you to open the script in the editor of your choice and create a backup copy before making any modifications.

To facilitate log searches, they are referenced in an XLSX file, enabling quick searches by computer, script, date, and more.

Please note that I used Visual Studio Code with GitHub Copilot for development. I am currently at Version 0.9, having conducted personal tests, and I'm awaiting your feedback to address any potential issues before moving to Version 1.

I am also open to any additional suggestions you may have.
