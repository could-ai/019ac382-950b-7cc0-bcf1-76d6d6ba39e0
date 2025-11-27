import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/comic_model.dart';

class ComicCard extends StatefulWidget {
  final Comic comic;

  const ComicCard({super.key, required this.comic});

  @override
  State<ComicCard> createState() => _ComicCardState();
}

class _ComicCardState extends State<ComicCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: _isHovered ? (Matrix4.identity()..scale(1.05)) : Matrix4.identity(),
        child: Card(
          elevation: _isHovered ? 12 : 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.network(
                  widget.comic.coverUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.comic.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'By ${widget.comic.author}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[400],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
