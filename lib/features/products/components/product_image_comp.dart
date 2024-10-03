import 'package:flutter/material.dart';

class ProductImageComp extends StatelessWidget {
  const ProductImageComp({super.key, required this.networkUrl});

  final String networkUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.blue.shade400,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          networkUrl,
          fit: BoxFit.fill,
          loadingBuilder: (context, child, loadingProgress) {
            final loadingValue = ((loadingProgress?.expectedTotalBytes ?? 1) /
                    (loadingProgress?.cumulativeBytesLoaded ?? 1))
                .toDouble();
            if (loadingValue != 1) {
              return CircularProgressIndicator(
                value: loadingValue,
              );
            } else {
              return child;
            }
          },
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.supervised_user_circle_outlined),
        ),
      ),
    );
  }
}
