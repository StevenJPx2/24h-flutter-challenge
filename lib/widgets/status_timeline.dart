import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;
import 'package:recase/recase.dart';
import 'package:timeline_tile/timeline_tile.dart';

enum TimelineStatus { done, doing, toDo }

TimelineTile getTile(
  String status,
  int valueIndex,
  int mainIndex, {
  bool start = false,
  bool end = false,
}) {
  final prevTimelineStatus = valueIndex - 1 < mainIndex
      ? TimelineStatus.done
      : valueIndex - 1 > mainIndex
          ? TimelineStatus.toDo
          : TimelineStatus.doing;

  final timelineStatus = valueIndex < mainIndex
      ? TimelineStatus.done
      : valueIndex > mainIndex
          ? TimelineStatus.toDo
          : TimelineStatus.doing;

  return TimelineTile(
    axis: TimelineAxis.horizontal,
    alignment: TimelineAlign.center,
    endChild: status.n
      ..color =
          timelineStatus == TimelineStatus.doing ? Colors.green : Colors.black,
    indicatorStyle: IndicatorStyle(
      color: timelineStatus == TimelineStatus.doing
          ? Colors.green
          : timelineStatus == TimelineStatus.toDo
              ? Colors.grey
              : Colors.black,
      iconStyle: IconStyle(
        iconData: Icons.check,
        color: timelineStatus == TimelineStatus.done
            ? Colors.white
            : Colors.transparent,
      ),
    ),
    isFirst: start,
    isLast: end,
    beforeLineStyle: LineStyle(
      color: prevTimelineStatus == TimelineStatus.toDo ||
              timelineStatus == TimelineStatus.toDo
          ? Colors.grey
          : Colors.black,
      thickness: prevTimelineStatus == TimelineStatus.done ? 4.0 : 2.0,
    ),
    afterLineStyle: LineStyle(
      color: timelineStatus == TimelineStatus.toDo ||
              timelineStatus == TimelineStatus.doing
          ? Colors.grey
          : Colors.black,
      thickness: timelineStatus == TimelineStatus.done ? 4.0 : 2.0,
    ),
  );
}

Widget getStatus<T extends Enum>(List<T> values, T comparedValue) {
  return n.ListView.children(
    values
        .map(
          (e) => getTile(
            e.name.titleCase,
            e.index,
            comparedValue.index,
          ),
        )
        .toList(),
  )
    ..h = 70.0
    ..scrollDirection = Axis.horizontal
    ..clip = Clip.antiAlias;
}
