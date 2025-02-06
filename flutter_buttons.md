Flutter propose différents types de boutons pour créer des interactions avec les utilisateurs. Ces boutons peuvent être utilisés pour soumettre des formulaires, déclencher des actions, naviguer entre les écrans, etc. Voici un tour d'horizon des principaux types de boutons dans Flutter avec des exemples pratiques.

---

## **1. ElevatedButton**

L'**`ElevatedButton`** (anciennement appelé **RaisedButton**) est un bouton qui est mis en relief et donne une impression d'élévation. Il est souvent utilisé pour des actions principales dans une interface utilisateur.

### **Exemple de code :**

```dart
ElevatedButton(
  onPressed: () {
    print("ElevatedButton Pressed");
  },
  child: Text('Elevated Button'),
)
```

### **Caractéristiques :**
- **`onPressed`** : action déclenchée lorsqu'on appuie sur le bouton.
- **`child`** : contenu du bouton (texte, icône, etc.).
- **Style personnalisable** : couleur de fond, forme, ombre, etc.

### **Exemple de personnalisation :**

```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    primary: Colors.blue, // Couleur du bouton
    onPrimary: Colors.white, // Couleur du texte
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  onPressed: () {},
  child: Text('Personnalisé'),
)
```

---

## **2. TextButton**

Le **`TextButton`** (anciennement appelé **FlatButton**) est un bouton sans élévation ni bordure. Il est souvent utilisé pour des actions secondaires.

### **Exemple de code :**

```dart
TextButton(
  onPressed: () {
    print("TextButton Pressed");
  },
  child: Text('Text Button'),
)
```

### **Caractéristiques :**
- Plat, sans ombre ni élévation.
- Utilisé pour des actions moins prioritaires.

### **Exemple de personnalisation :**

```dart
TextButton(
  style: TextButton.styleFrom(
    primary: Colors.blue, // Couleur du texte
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  ),
  onPressed: () {},
  child: Text('Bouton texte personnalisé'),
)
```

---

## **3. OutlinedButton**

Le **`OutlinedButton`** est un bouton qui a une bordure mais pas de couleur de fond par défaut. Il est souvent utilisé pour des actions secondaires ou des actions moins importantes.

### **Exemple de code :**

```dart
OutlinedButton(
  onPressed: () {
    print("OutlinedButton Pressed");
  },
  child: Text('Outlined Button'),
)
```

### **Caractéristiques :**
- Un bouton avec une bordure.
- Pas de couleur de fond par défaut.

### **Exemple de personnalisation :**

```dart
OutlinedButton(
  style: OutlinedButton.styleFrom(
    primary: Colors.blue, // Couleur du texte
    side: BorderSide(color: Colors.blue, width: 2), // Bordure personnalisée
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  ),
  onPressed: () {},
  child: Text('Bouton à contour personnalisé'),
)
```

---

## **4. IconButton**

L'**`IconButton`** est un bouton qui contient uniquement une icône et pas de texte. Il est souvent utilisé pour des actions dans les barres d'outils ou des boutons flottants.

### **Exemple de code :**

```dart
IconButton(
  icon: Icon(Icons.thumb_up),
  onPressed: () {
    print("IconButton Pressed");
  },
)
```

### **Caractéristiques :**
- Bouton uniquement avec une icône.
- Utilisé pour des actions visuelles ou dans des interfaces minimalistes.

### **Exemple de personnalisation :**

```dart
IconButton(
  icon: Icon(Icons.favorite),
  color: Colors.red,
  iconSize: 30,
  onPressed: () {
    print("Bouton avec icône personnalisé");
  },
)
```

---

## **5. FloatingActionButton**

Le **`FloatingActionButton`** (FAB) est un bouton flottant circulaire qui est souvent utilisé pour l'action principale d'une page (exemple : ajouter un élément dans une liste).

### **Exemple de code :**

```dart
FloatingActionButton(
  onPressed: () {
    print("FloatingActionButton Pressed");
  },
  child: Icon(Icons.add),
)
```

### **Caractéristiques :**
- Bouton circulaire flottant au-dessus de l'interface.
- Utilisé pour l'action la plus importante de la page.

### **Exemple de personnalisation :**

```dart
FloatingActionButton(
  backgroundColor: Colors.blue,
  child: Icon(Icons.add, size: 30),
  onPressed: () {
    print("Bouton flottant personnalisé");
  },
)
```

---

## **6. DropdownButton**

Le **`DropdownButton`** permet de sélectionner une option parmi une liste déroulante.

### **Exemple de code :**

```dart
String dropdownValue = 'One';

DropdownButton<String>(
  value: dropdownValue,
  onChanged: (String? newValue) {
    dropdownValue = newValue!;
  },
  items: <String>['One', 'Two', 'Three', 'Four']
      .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList(),
)
```

### **Caractéristiques :**
- Permet de sélectionner une option dans une liste déroulante.
- Utilisé pour les formulaires ou les paramètres.

---

## **7. CupertinoButton**

Le **`CupertinoButton`** est un bouton qui suit le design iOS. Il est disponible dans la bibliothèque **`cupertino`** de Flutter.

### **Exemple de code :**

```dart
import 'package:flutter/cupertino.dart';

CupertinoButton(
  child: Text("Cupertino Button"),
  color: CupertinoColors.activeBlue,
  onPressed: () {
    print("CupertinoButton Pressed");
  },
)
```

### **Caractéristiques :**
- Suivant les directives de design d'Apple (iOS).
- Utilisé pour des applications à thème Cupertino.

---

## **8. InkWell (Zone cliquable)**

Le **`InkWell`** n'est pas exactement un bouton, mais il permet de créer une **zone cliquable** qui réagit visuellement avec un effet d'encre.

### **Exemple de code :**

```dart
InkWell(
  onTap: () {
    print("InkWell Pressed");
  },
  child: Container(
    padding: EdgeInsets.all(12),
    child: Text('Cliquez ici'),
  ),
)
```

### **Caractéristiques :**
- Effet d'onde lorsqu'on clique sur la zone.
- Utilisé pour rendre toute zone interactive, pas forcément un bouton.

---

## **Résumé des types de boutons**

| **Type de bouton**       | **Utilisation**                                                                 |
|--------------------------|--------------------------------------------------------------------------------|
| **ElevatedButton**        | Action principale, avec élévation (effet 3D).                                   |
| **TextButton**            | Action secondaire, plat sans élévation.                                         |
| **OutlinedButton**        | Action secondaire, avec contour et sans fond.                                  |
| **IconButton**            | Actions représentées par des icônes uniquement.                                |
| **FloatingActionButton**  | Action principale d'une page, bouton flottant circulaire.                      |
| **DropdownButton**        | Sélection d'une option parmi une liste déroulante.                             |
| **CupertinoButton**       | Bouton iOS.                                                                    |
| **InkWell**               | Zone cliquable avec effet visuel (onde).                                        |

---



 ██████╗ ██████╗  █████╗ ██╗   ██╗ ██████╗ 
 ██╔══██╗██╔══██╗██╔══██╗██║   ██║██╔═══██╗
 ██████╔╝██████╔╝███████║██║   ██║██║   ██║
 ██╔══██╗██╔══██╗██╔══██║╚██╗ ██╔╝██║   ██║
 ██████╔╝██║  ██║██║  ██║ ╚████╔╝ ╚██████╔╝
 ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝   ╚═════╝ 
 