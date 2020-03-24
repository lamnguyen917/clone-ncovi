import 'package:flutter/material.dart';

class TimeLine extends StatelessWidget {
  final double itemGap;
  final List<Widget> children;
  final int itemCount;
  final ScrollController controller;
  final PaintingStyle indicatorStyle;
  final double indicatorSize;
  final double lineGap;
  final Color mainIndicatorColor;

  const TimeLine({
    @required this.children,
    this.itemGap = 0,
    this.controller,
    this.indicatorStyle = PaintingStyle.stroke,
    this.indicatorSize = 20.0,
    this.lineGap = 8.0,
    this.mainIndicatorColor = Colors.black,
  })  : itemCount = children.length,
        assert(itemGap >= 0);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => SizedBox(
        height: itemGap,
      ),
      shrinkWrap: true,
      primary: false,
      controller: controller,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        final child = children[index];

        final timelineTile = <Widget>[
          Expanded(
            flex: 1,
            child: CustomPaint(
              foregroundPainter: _TimelinePainter(
                indicatorSize: indicatorSize,
                lineGap: lineGap,
                itemGap: itemGap,
                mainIndicatorColor: mainIndicatorColor,
              ),
              child: SizedBox(
                height: double.infinity,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 18,
            child: child,
          ),
        ];

        return IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: timelineTile,
          ),
        );
      },
    );
  }
}

class _TimelinePainter extends CustomPainter {
  final double indicatorSize;
  final double itemGap;
  final double lineGap;
  final Paint linePaint;
  final Paint circlePaint;
  final Color mainIndicatorColor;

  _TimelinePainter({
    @required this.indicatorSize,
    @required this.itemGap,
    @required this.lineGap,
    @required this.mainIndicatorColor,
  })  : circlePaint = Paint()..color = mainIndicatorColor,
        linePaint = Paint()..color = mainIndicatorColor;

  @override
  void paint(Canvas canvas, Size size) {
    final indicatorRadius = indicatorSize / 2;
    final indicatorMargin = 2 * indicatorRadius + lineGap;

    final Offset offsetTop =
        size.topLeft(Offset(indicatorRadius, indicatorRadius));

    canvas.drawCircle(offsetTop, indicatorRadius, circlePaint);

    final topLineOffset =
        size.topLeft(Offset(indicatorRadius, indicatorMargin));

    final bottomLineOffset = size.bottomLeft(Offset(indicatorRadius, itemGap));

    canvas.drawLine(topLineOffset, bottomLineOffset, linePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
