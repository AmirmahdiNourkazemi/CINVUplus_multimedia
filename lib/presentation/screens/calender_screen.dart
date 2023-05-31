import 'package:connectplus/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calender'),
      ),
      body: SafeArea(
        child: TableCalendar(
          calendarFormat: CalendarFormat.month,
          formatAnimationCurve: Curves.bounceIn,
          headerStyle: HeaderStyle(
            leftChevronIcon: Icon(
              size: 32,
              Icons.chevron_left,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : const Color(0xff2E3F6D),
            ),
            rightChevronIcon: Icon(
              Icons.chevron_right,
              size: 32,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : const Color(0xff2E3F6D),
            ),
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            weekendStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : const Color(0xff2E3F6D),
            ),
            weekdayStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : const Color(0xff2E3F6D),
            ),
          ),
          headerVisible: true,
          calendarStyle: CalendarStyle(
            todayTextStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xff2E3F6D)
                  : Colors.white,
            ),
            todayDecoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : const Color(0xff2E3F6D),
              shape: BoxShape.circle,
            ),
            rangeHighlightColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : const Color(0xff2E3F6D),
            weekNumberTextStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : const Color(0xff2E3F6D),
            ),
            weekendTextStyle: TextStyle(color: Colors.red.shade400),
            defaultTextStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : const Color(0xff2E3F6D),
            ),
            // rangeHighlightScale: 1.8,
          ),
          shouldFillViewport: true,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
        ),
      ),
    );
  }
}
