import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:slashdiscount/styles/colors.dart';

class ShimmerDefault extends StatelessWidget {
  final double height;
  const ShimmerDefault({Key? key,required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4,horizontal: 5),
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(15)
          ),
        ),
        baseColor: MyColor.shimmerBaseColor.withOpacity(0.29),
        highlightColor: MyColor.shimmerHighlightColor.withOpacity(0.1)
    );
  }
}
