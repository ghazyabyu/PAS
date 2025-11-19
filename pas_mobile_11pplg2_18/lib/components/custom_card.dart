import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg2_18/models/tvshowmodel.dart' hide Image;

class TvshowCard extends StatefulWidget {
  final Tvshowmodel tvshow;
  final bool isFavorite;
  final ValueChanged<bool>? onFavoriteChanged;

  const TvshowCard({
    Key? key,
    required this.tvshow,
    this.isFavorite = false,
    this.onFavoriteChanged,
  }) : super(key: key);

  @override
  State<TvshowCard> createState() => _TvshowCardState();
}

class _TvshowCardState extends State<TvshowCard> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  @override
  void didUpdateWidget(covariant TvshowCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isFavorite != widget.isFavorite) {
      setState(() {
        _isFavorite = widget.isFavorite;
      });
    }
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    if (widget.onFavoriteChanged != null) {
      widget.onFavoriteChanged!(_isFavorite);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.tvshow.image ?.medium ?? '',
                height: 80,
                width: 80,
                fit: BoxFit.cover,
                errorBuilder: (ctx, err, stack) => Container(
                  height: 80,
                  width: 80,
                  color: Colors.grey.shade200,
                  child: Icon(Icons.broken_image, color: Colors.grey.shade400),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.tvshow.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.star, size: 16, color: Colors.amber.shade600),
                      const SizedBox(width: 4),
                      Text(
                        "${widget.tvshow.rating.average.toString()}/5",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ],
              ),
            ),

            Column(
              children: [
                IconButton(
                  onPressed: _toggleFavorite,
                  icon: Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: _isFavorite ? Colors.red : Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
