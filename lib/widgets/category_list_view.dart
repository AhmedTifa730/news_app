 import 'package:flutter/material.dart';
import 'package:news/widgets/category_card.dart';

ListView CategoriesListView() {
    return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return cards[index];
                });
  }

  




const List<CategoryCard> cards =  [
    CategoryCard(image: 'assets/download.jpeg', word: 'sports'),
    CategoryCard(image: 'assets/entertaiment.avif', word: 'entertainment'),
    CategoryCard(image: 'assets/health.avif', word: 'health'),
    CategoryCard(image: 'assets/science.avif', word: 'science'),
    CategoryCard(image: 'assets/technology.jpeg', word: 'technology'),
  ];