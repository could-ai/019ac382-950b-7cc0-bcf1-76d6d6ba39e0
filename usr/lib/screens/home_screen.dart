import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/comic_model.dart';
import 'package:couldai_user_app/widgets/comic_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Comic> _comics = List.generate(
    20,
    (index) => Comic(
      title: 'Comic Title #${index + 1}',
      author: 'Author ${index + 1}',
      coverUrl: 'https://picsum.photos/seed/${index + 1}/300/450',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Comic Hub',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: _comics.length,
          itemBuilder: (context, index) {
            return ComicCard(comic: _comics[index]);
          },
        ),
      ),
    );
  }
}
