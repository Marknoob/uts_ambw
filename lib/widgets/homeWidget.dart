import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uts_ambw/pages/cardItem.dart';
import 'package:uts_ambw/pages/imagePlaceHolder.dart';
import 'package:uts_ambw/pages/mealDeals.dart';
import 'package:uts_ambw/pages/mostPopular.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
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

  late List<Widget> _pages;
  int _activePage = 0;
  @override
  void initState() {
    super.initState();
    _pages = List.generate(
      firstlistFoodImage.length,
      (index) => ImagePlaceHolder(
        imageUrl: firstlistFoodImage[index],
      ),
    );
  }

  final _pageController = PageController(initialPage: 0);

  final TextEditingController _textController =
      TextEditingController(text: "Search For Restaurants");

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const SizedBox(height: 10),

          // Search Bar
          Container(
            padding: const EdgeInsets.only(
              top: 5,
              right: 15,
              left: 15,
              bottom: 10,
            ),
            child: CupertinoSearchTextField(
              controller: _textController,
            ),
          ),

          const SizedBox(height: 10),

          // Image slider
          SizedBox(
            width: double.infinity,
            // height: MediaQuery.of(context).size.height / 4,
            height: 300,
            child: PageView.builder(
              controller: _pageController,
              itemCount: firstlistFoodImage.length,
              onPageChanged: (value) {
                setState(() {
                  _activePage = value;
                });
              },
              itemBuilder: (context, index) {
                return _pages[index];
              },
            ),
          ),

          const SizedBox(height: 5),

          // Image slider detail
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Food Name
              Container(
                // color: Colors.amber[200],
                width: 275,
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "${firstlistFoodName[_activePage]}",
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // Bullet Slide
              Container(
                padding: const EdgeInsets.only(right: 10),
                // color: Colors.amber[300],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                    _pages.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: _activePage == index
                            ? Colors.red[200]
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          // Most Popular
          Container(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Most Popular",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return MostPopularPage();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    "See all",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.only(left: 10),
            height: 201,
            // color: Colors.green[100],
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: firstlistFoodName.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(right: 15),
                  child: MyCardItem(
                    restaurantName: firstlistRestaurantName[index],
                    restaurantAddress: firstlistRestaurantAddress[index],
                    foodName: firstlistFoodName[index],
                    foodImage: firstlistFoodImage[index],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // Meal Deals
          Container(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Meal Deals",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return MealDealsPage();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    "See all",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.only(left: 10),
            height: 201,
            // color: Colors.green[100],
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: firstlistFoodName.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(right: 15),
                  child: MyCardItem(
                    restaurantName: firstlistRestaurantName[index],
                    restaurantAddress: firstlistRestaurantAddress[index],
                    foodName: firstlistFoodName[index],
                    foodImage: firstlistFoodImage[index],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
