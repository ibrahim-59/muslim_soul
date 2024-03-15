import 'package:flutter/widgets.dart';
import 'package:svg_flutter/svg.dart';

class CustomCenterImage extends StatelessWidget {
  const CustomCenterImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SvgPicture.asset(
        image,
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        allowDrawingOutsideViewBox: false,
        height: size.width,
      ),
    );
  }
}
