import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news/widgets/category_list_view.dart';
import 'package:news/widgets/news_list_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News ',
              style: TextStyle(
                color: Color(0xff8A241F),
                fontSize: 30,
              ),
            ),
            Text(
              'Cloud ',
              style: TextStyle(
                color: Colors.black12,
                fontSize: 25,
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 85,
                child: CategoriesListView(),
              ),
            ),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 32,
            )),
            const NewsListViewBuilder(
              category: 'general',
            ),
            // const SliverToBoxAdapter(
            //   child: NewsListView(),
            // )
          ],
        ),
      ),

      // child: Column(
      //   children: [
      //     SizedBox(
      //       height: 85,
      //       child: CategoriesListView(),
      //     ),
      //     const SizedBox(
      //       height: 12,
      //     ),
      //     const Expanded(child: NewsListView()),
      //   ],
      // ),
    );
  }
}
