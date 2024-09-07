import 'package:flutter/material.dart';
import 'package:news/views/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.image,
    required this.word,
  });

  final String image;
  final String word;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return  CategoryView(
                category: word,
              );
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Container(
          height: 85,
          width: 170,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(21),
          ),
          child: Center(
              child: Text(
            word,
            style: const TextStyle(fontSize: 22, color: Colors.white70),
          )),
        ),
      ),
    );
  }
}
