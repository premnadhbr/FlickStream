import 'package:flickstream/services/services.dart';
import 'package:flutter/material.dart';

class TopRatedSlider extends StatelessWidget {
  const TopRatedSlider({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  final snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              onTap: () {
                final movie = snapshot.data![index];
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  child: Image.network(
                    "${Api.imagePath}${snapshot.data![index].posterPath}",
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
