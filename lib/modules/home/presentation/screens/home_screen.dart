import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:prayer_book/constants/app_constants.dart';
import 'package:prayer_book/constants/color_palette/green_palette.dart';
import 'package:prayer_book/utils/extensions/context_extensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateTime selectedDate;

  @override
  void initState() {
    selectedDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? locale = AppLocalizations.of(context)!.localeName;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: context.deviceSize.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        var newDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime(2025, 01, 01),
                          lastDate: DateTime(2025, 12, 31),
                          initialDate: selectedDate,
                        ).then((newDate) {
                          setState(() {
                            selectedDate = newDate ?? selectedDate;
                          });
                        });
                      },
                      child: Row(
                        children: [
                          Text(
                            selectedDate.day.toString().padLeft(2, '0'),
                            style: TextStyle(fontSize: 60, fontWeight: FontWeight.w600, fontFamily: kDefaultFont),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat('MMMM').format(selectedDate).toUpperCase(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                selectedDate.year.toString(),
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          DateFormat('EEEE').format(selectedDate).toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text('SUVARA WEEK 2', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Builder(builder: (context) {
              return AnimatedSwitcher(
                duration: Duration(seconds: 1),
                child: GestureDetector(
                  onHorizontalDragEnd: (details) {
                    if (details.velocity.pixelsPerSecond.dx > 100) {
                      if ((selectedDate.add(Duration(days: -1))).isBefore(kFirstSelectableDate)) {
                        print('invalid range');
                      } else {
                        setState(() {
                          selectedDate = selectedDate.add(Duration(days: -1));
                        });
                      }
                    } else if (details.velocity.pixelsPerSecond.dx < 100) {
                      if ((selectedDate.add(Duration(days: 1))).isAfter(kLastSelectableDate)) {
                        print('invalid range');
                      } else {
                        setState(() {
                          selectedDate = selectedDate.add(Duration(days: 1));
                        });
                      }
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    padding: const EdgeInsets.all(10),
                    height: 200,
                    width: context.deviceSize.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: greenPalette.shade100,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // todo remove after test
                        // Text(selectedDate.toString()),
                        if (_specialities.isNotEmpty) ...[
                          ...List.generate(_specialities.length, (index) {
                            return Text(_specialities[index], style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, fontFamily: kDefaultFont), key: Key('Specialities$index'));
                          }),
                          Divider(
                            indent: 40,
                            endIndent: 40,
                            color: Colors.black,
                          ),
                        ],
                        if (_readings.isNotEmpty) ...[
                          ...List.generate(_readings.length, (index) {
                            return Text(
                              _readings[index],
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, fontFamily: kDefaultFont),
                              key: Key('Readings$index'),
                            );
                          })
                        ],
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

List<String> _specialities = ['Feast of Saint John', 'Remembrance of All Saints', 'Last day to submit Assignment'];

List<String> _readings = ['Mark 7: 13-30', 'John 3: 10-14', 'Matthew 7: 1-20', 'Psalm 1: 1-20'];
