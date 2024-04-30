import 'package:flutter/material.dart';

class MyCardItem extends StatelessWidget {
  final String restaurantName;
  final String restaurantAddress;
  final String foodName;
  final String foodImage;

  const MyCardItem({
    required this.restaurantName,
    required this.restaurantAddress,
    required this.foodName,
    required this.foodImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.blue[300],
      elevation: 7,
      child: Column(
        children: [
          Container(
            height: 120,
            width: 150,
            // color: Colors.blue[200],
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                topLeft: Radius.circular(8),
              ),
              child: Image.asset(
                // 'lib/images/image1.png',
                foodImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            // color: Colors.blue[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 5, left: 5),
                  width: 150,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      // "Restaurant Name",
                      restaurantName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 5, left: 5),
                  width: 150,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      // "Street",
                      restaurantAddress,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 154, 150, 150),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 5, left: 5),
                  width: 150,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      // "Food Name",
                      foodName,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 154, 150, 150),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
