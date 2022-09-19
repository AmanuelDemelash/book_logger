import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class recentshimmer extends StatelessWidget {
  const recentshimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.25),
      highlightColor: Colors.white.withOpacity(0.6),
      direction: ShimmerDirection.ltr,
      period: const Duration(seconds: 3),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        color: Theme.of(context).bottomAppBarColor.withOpacity(0.5),
        height: 130,
        width: 120,
      ),
    );
  }
}
