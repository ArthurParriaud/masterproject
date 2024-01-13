# Projet Master - Système d'Assistance Alimentaire pour Régimes Spéciaux - Partie Front

De nos jours, beaucoup de personnes ont des restrictions alimentaires, ou
souhaitent manger plus léger ou moins sucré dans le but de perdre du poids. Trouver
la recette adaptée à son régime peut s’avérer difficile : il existe de nombreux sites
répertoriant plusieurs recettes mais en trouver une nous correspondant passe par une
recherche détaillée et pouvant être complexe. C’est dans ce contexte que nous nous
plaçons : on sait que l’intelligence artificielle peut apprendre de données pour prédire
une valeur cible. On arrive donc à la problématique suivante : Comment concevoir et
développer un système de recommandation de recettes de cuisine intelligent qui
prend en compte les régimes spéciaux et propose des recettes adaptées aux besoins
nutritionnels, aux allergies alimentaires et aux préférences alimentaires des
utilisateurs ?

L’idée de base est de créer une fonction de recommandation utilisant des modèles de
Deep Learning pour fournir à un utilisateur la recette qui lui correspond le mieux.
Notre objectif final est de concevoir une application mobile dans laquelle est intégrée
cette fonction de recommandation.

## Interface Utilisateur

  L'une des grandes parties de notre projet est l’interface utilisateur. En effet,
rappelons que notre objectif final est de créer une application mobile intégrant notre
système de recommandation directement dans les mains des utilisateurs : être plus
simple d’utilisation que des sites existants pour chercher une recette est l’une des
forces de notre projet.

  Pour avoir un résultat présentable, nous avons fait le choix pour l’instant de
créer une application windows avec Flutter : développé par Google, il s’agit d’un
cadre de développement open source conçu pour simplifier la création d'applications
mobiles hautes performances, attrayantes et fluides sur plusieurs plateformes. Lancé
en 2017, Flutter a rapidement gagné en popularité en raison de ses fonctionnalités
novatrices et de sa flexibilité.

### Caractéristiques Principales :

- **Multiplateforme** : L'un des points forts de Flutter est sa capacité à permettre
le développement d'applications pour iOS, Android, le web et même le bureau,
à partir d'une seule base de code. Cette approche favorise une gestion efficace
des ressources tout en réduisant les coûts de développement.

- **Widgets Riches et Personnalisables** : Flutter utilise une approche basée sur
des widgets, des éléments d'interface utilisateur modulaires. Avec une vaste
bibliothèque de widgets prêts à l'emploi et la possibilité de créer des widgets
personnalisés, les développeurs peuvent concevoir des interfaces utilisateur
riches et interactives.

- **Performances Exceptionnelles** : Flutter se distingue par ses performances
exceptionnelles grâce à son moteur de rendu graphique, Skia. Les applications
Flutter offrent une expérience utilisateur fluide et réactive, indépendamment de
la plateforme.

- **Hot Reload** : La fonctionnalité Hot Reload de Flutter permet aux
développeurs de visualiser instantanément les modifications apportées au code,
accélérant ainsi le processus de développement et facilitant le test itératif.

- **Langage de Programmation Dart** : Flutter utilise Dart comme langage de
programmation, offrant une syntaxe simple et moderne. Dart est optimisé pour
le développement d'applications réactives, ce qui en fait un choix idéal pour
Flutter.

- **Communauté Active et Support Robuste** : La communauté Flutter est
dynamique et engagée, offrant un soutien continu aux développeurs. La
documentation complète, les didacticiels et les forums en ligne facilitent
l'apprentissage et la résolution des problèmes.

## Notre Réflexion

Flutter émerge comme un choix de prédilection pour nous, sachant qu’il a l’avantage
d’être multiplateforme : aujourd’hui, nous avons une application de bureau, mais
pour notre objectif final, l’adapter sur une application mobile ne représentera ni un
problème technique, ni de temps.
