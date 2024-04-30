import 'package:flutter/material.dart';

class MealDealsPage extends StatelessWidget {
  MealDealsPage({super.key});

  final List firstlistRestaurantName = [
    'Mighty Quinns Barbeque',
    'Pommes frites',
    'Plats Haj Boujemaa fish',
    'Kanapa Restaurant',
    'Restaurant Le Tagliatelle',
  ];

  final List firstlistRestaurantAddress = [
    '1105 Morris Ave Suite H, United States',
    '256 S Palm Canyon, United States',
    '12 Rue Mohammed el Beqal, Morocco',
    'Andreevskiy Spusk, 19, Kyiv 01025 Ukraine',
    'Promenade du soleil, 06500, Menton France',
  ];

  final List firstlistFoodName = [
    'Hamburger and Fries',
    'French fries',
    'Roasted fish and potatoes',
    'Holubtsi',
    'Fresh tagliatelle with chicken and veggies',
  ];

  final List firstlistFoodImage = [
    'lib/images/image1.jpg',
    'lib/images/image2.jpg',
    'lib/images/image3.jpg',
    'lib/images/image4.jpg',
    'lib/images/image5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(width: 10),
              const Text(
                "Meal Deals",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: firstlistFoodName.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  ),
                  child: Image.asset(
                    firstlistFoodImage[index],
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          firstlistRestaurantName[index],
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          firstlistRestaurantAddress[index],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 154, 150, 150),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          firstlistFoodName[index],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 154, 150, 150),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
              ],
            );
          },
        ),
      ),
    );
  }
}
