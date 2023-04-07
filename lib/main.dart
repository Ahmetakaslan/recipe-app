import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recipe/consr.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe/values.dart';
import 'package:recipe/bottoNawigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    change();
  }

  Future<bool> turnOff() {
    return exit(0);
  }

  int index = 0;
  Color favColor = Colors.white;
  Color color = Colors.green;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: key,
      drawer: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 62, 64, 105),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(60),
            bottomRight: Radius.circular(60),
          ), 
        ),
        height: double.infinity,
        width: size.width * .5,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text("Saved Data"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            turnOff();
          },
        ),
        elevation: 0,
        backgroundColor: color,
        title: Text(widget.title),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              child: Text("${list[index].caseOfFood}"),
            ),
          )
        ],
      ),
      body: WillPopScope(
        onWillPop: () => turnOff(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  FirstStep(size, list),
                  SecodStep(size, list),
                  ThirdStep(list),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "${list[index].recipe}",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  
                  
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

// **********************************************************
  IconButton defaultIcon(Color color, IconData icon, Function fun) {
    return IconButton(
      onPressed: () {
        fun;
      },
      icon: Icon(
        icon,
        color: color,
      ),
    );
  }

  Row ThirdStep(List<Values> list) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(30),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "${list[index].minutes} kcal",
              style: kdefaultStyle2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(30),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text("${list[index].countOfPerson} person",
                style: kdefaultStyle2, textAlign: TextAlign.center),
          ),
        ),
      ],
    );
  }

  Padding SecodStep(Size size, List<Values> list) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Text(
              "${list[index].minutes} minutes",
              style: kdefaultStyle,
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 17, 136, 205),
              ),
              child: Container(
                height: size.height * .2,
                width: 80,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * .06,
                        child: IconButton(
                            onPressed: () {
                              if (favColor != Colors.orange) {
                                setState(() {
                                  favColor = Colors.orange;
                                });
                              } else {
                                setState(() {
                                  favColor = Colors.white;
                                });
                              }
                            },
                            icon: Icon(Icons.thumb_up_sharp),
                            color: favColor),
                      ),
                      SizedBox(
                        height: size.height * .09,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.star),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container FirstStep(Size size, List<Values> list) {
    return Container(
      width: double.infinity,
      height: size.height * .6,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(200),
          bottomRight: Radius.circular(200),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${list[index].nameOfFood}",
              style: kdefaultStyle,
            ),
          ),
          GestureDetector(
            onHorizontalDragUpdate: (details) {
              favColor = Colors.white;
              double a = details.delta.dx;
              debugPrint("Deger : $a");
              if (a > 2) {
                if (index < 4) {
                  setState(() {
                    index++;
                    color = list[index].color;
                  });
                } else {
                  setState(() {
                    index = 0;
                  });
                }
              } else {
                if (index != 0) {
                  setState(() {
                    index--;
                    color = list[index].color;
                  });
                } else {
                  setState(() {
                    index = list.length - 1;
                  });
                }
              }
            },
            child: CircleAvatar(
              minRadius: 150,
              backgroundImage:
                  AssetImage("assets/resimler/${list[index].imageOfFood}"),
            ),
          )
        ],
      ),
    );
  }

  List<Values> list = <Values>[];
  void change() {
    list.add(Values(
        id: 0,
        nameOfFood: "pasta",
        imageOfFood: "makarna.jpg",
        kcalOfFood: "200",
        countOfPerson: 3,
        minutes: 20,
        caseOfFood: "easy",
        recipe: """Here's a simple recipe for basic pasta:

Ingredients:

8 ounces of dried pasta (spaghetti, fettuccine, penne, etc.)
4-6 cups of water
Salt, to taste
1-2 tablespoons of olive oil
Instructions:

Fill a large pot with 4-6 cups of water and add a pinch of salt. Bring the water to a boil over high heat.

Once the water is boiling, add the pasta to the pot. Stir the pasta occasionally to prevent it from sticking together.

Cook the pasta according to the package instructions or until it is al dente, which means it should be cooked but still slightly firm to the bite.

Once the pasta is cooked, use a colander or strainer to drain it.

Rinse the pasta under cold water to stop the cooking process and to cool it down slightly.

Return the pasta to the pot and add 1-2 tablespoons of olive oil. Toss the pasta gently to coat it with the oil and to prevent it from sticking together.

Serve the pasta hot with your favorite sauce, such as tomato sauce, pesto, or alfredo sauce.

Enjoy your delicious and simple pasta dish!



""",
        color: Colors.green));
    list.add(Values(
        id: 1,
        nameOfFood: "chips",
        imageOfFood: "patates.jpg",
        kcalOfFood: "400",
        countOfPerson: 5,
        minutes: 30,
        caseOfFood: "easy",
        recipe: """Here's a simple recipe for homemade potato chips:

Ingredients:

2-3 large potatoes
2 tablespoons olive oil
Salt, to taste
Instructions:

Preheat your oven to 375°F (190°C).

Wash and scrub the potatoes thoroughly to remove any dirt or debris. Slice the potatoes as thinly as possible, either by hand or using a mandoline.

Place the sliced potatoes in a large mixing bowl and add the olive oil. Toss the potatoes until they are evenly coated with the oil.

Arrange the potato slices in a single layer on a baking sheet lined with parchment paper. Make sure they are not touching each other.

Sprinkle the potato slices with salt to taste.

Bake the potato chips for 15-20 minutes, or until they are golden brown and crispy. Keep an eye on them as they cook, as they can easily burn.

Remove the baking sheet from the oven and let the potato chips cool for a few minutes. Serve them hot and crispy.

Enjoy your homemade potato chips as a delicious and healthier alternative to store-bought chips!""",
        color: Color.fromARGB(255, 244, 3, 3)));
    list.add(Values(
        id: 2,
        nameOfFood: "Turkish Stuffed Meatball ",
        imageOfFood: "içliköfte.jpg",
        kcalOfFood: "420",
        countOfPerson: 6,
        minutes: 50,
        caseOfFood: "Hard",
        recipe:
            """  Here's a simple recipe for Turkish stuffed meatballs, or "İçli Köfte":

Ingredients:

1 pound ground beef
1 onion, finely chopped
1 cup fine bulgur wheat
2 tablespoons tomato paste
1 tablespoon red pepper paste (optional)
1 tablespoon pepper flakes
1 teaspoon salt
1/2 teaspoon ground black pepper
1/2 teaspoon ground cumin
1/4 cup vegetable oil
2 tablespoons butter
1 cup boiling water
For the filling:

1/2 pound ground beef or lamb
1 onion, finely chopped
1/2 teaspoon salt
1/4 teaspoon ground black pepper
1/4 teaspoon ground cumin
1/4 teaspoon paprika
Instructions:

To make the filling, combine the ground beef or lamb, onion, salt, black pepper, cumin, and paprika in a bowl. Mix well and set aside.

To make the dough, combine the ground beef, chopped onion, bulgur wheat, tomato paste, red pepper paste (if using), pepper flakes, salt, black pepper, and cumin in a large mixing bowl. Knead the mixture until it becomes a soft dough.

In a separate pan, heat the vegetable oil and butter over medium heat. Add the boiling water and mix well.

Take a small amount of the dough (about the size of a golf ball) and flatten it into a round shape with your hands. Place a spoonful of the filling in the center and fold the edges of the dough over the filling to form a ball. Repeat with the remaining dough and filling.

Place the stuffed meatballs in the pan with the hot oil and water mixture, making sure they are not touching each other. Cover the pan and cook over low heat for 20-25 minutes, or until the meatballs are cooked through and the dough is tender.

Serve the stuffed meatballs hot, garnished with chopped parsley and lemon wedges.

Enjoy your delicious Turkish stuffed meatballs!



  """,
        color: Color.fromARGB(255, 4, 160, 184)));

    list.add(Values(
      id: 3,
      nameOfFood: "lentil soup",
      imageOfFood: "mercimek.jpg",
      kcalOfFood: "250",
      countOfPerson: 3,
      minutes: 30,
      caseOfFood: "Medium",
      recipe: """Here's a simple recipe for lentil soup:

Ingredients:

1 tablespoon olive oil
1 onion, chopped
3 cloves garlic, minced
2 carrots, peeled and chopped
2 celery stalks, chopped
1 teaspoon ground cumin
1 teaspoon ground coriander
1/2 teaspoon paprika
1/4 teaspoon cayenne pepper (optional)
1 cup red lentils, rinsed and drained
4 cups vegetable broth or chicken broth
1 bay leaf
Salt and pepper, to taste
Fresh lemon juice, to taste
Fresh parsley, chopped (optional)
Instructions:

Heat the olive oil in a large pot or Dutch oven over medium heat. Add the onion and garlic and cook until the onion is soft and translucent, about 5 minutes.

Add the carrots and celery and cook for another 5 minutes, stirring occasionally.

Stir in the cumin, coriander, paprika, and cayenne pepper (if using) and cook for 1 minute.

Add the lentils, broth, and bay leaf to the pot and bring to a boil. Reduce the heat to low and simmer for 20-25 minutes, or until the lentils are soft and tender.

Remove the bay leaf and season the soup with salt, pepper, and lemon juice to taste.

Serve hot, garnished with chopped parsley (if desired).

Enjoy your delicious and healthy lentil soup!""",
      color: Colors.yellow,
    ));

    list.add(Values(
        id: 4,
        nameOfFood: "fried chicken",
        imageOfFood: "tavuk.jpg",
        kcalOfFood: "550",
        countOfPerson: 5,
        minutes: 60,
        caseOfFood: "Hard",
        recipe: """ Here is a simple recipe for fried chicken:

Ingredients:

1 whole chicken, cut into pieces
2 cups buttermilk
1 tablespoon hot sauce (optional)
2 cups all-purpose flour
1 tablespoon paprika
1 tablespoon garlic powder
1 tablespoon onion powder
1 tablespoon salt
1 teaspoon black pepper
Vegetable oil, for frying
Instructions:

In a large bowl, whisk together buttermilk and hot sauce (if using). Add the chicken pieces and toss to coat. Cover with plastic wrap and refrigerate for at least 1 hour, or overnight.

In a large paper bag or resealable plastic bag, combine the flour, paprika, garlic powder, onion powder, salt, and black pepper. Shake to mix.

Remove the chicken from the buttermilk and let any excess liquid drip off. Put the chicken pieces in the bag with the flour mixture and shake to coat thoroughly.

Heat about 1 inch of vegetable oil in a large skillet or Dutch oven over medium-high heat until it reaches 350°F (175°C).

Carefully add the chicken pieces to the hot oil, skin side down. Do not overcrowd the skillet; cook the chicken in batches if necessary.

Fry the chicken for 15-20 minutes, turning occasionally, until the chicken is golden brown and cooked through (the internal temperature of the chicken should reach 165°F/75°C).

Use a slotted spoon or tongs to remove the chicken from the skillet and place on a wire rack to drain excess oil.

Serve hot with your favorite sides.

Enjoy your homemade fried chicken!""",
        color: Colors.blue));
  }
}
