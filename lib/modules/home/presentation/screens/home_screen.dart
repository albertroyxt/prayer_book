import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:prayer_book/utils/extensions/context_extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              child: Row(
                children: [
                  Text('31'),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('DECEMBER'),
                      Text('2024'),
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('TUESDAY'),
                      Text('SUVARA WEEK 2'),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Builder(builder: (context) {
              return AnimatedSwitcher(
                duration: Duration(seconds: 1),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  padding: const EdgeInsets.all(10),
                  height: 100,
                  width: context.deviceSize.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  child: Column(
                    children: [
                      Text('Feast of Saint John'),
                      Text('Remembrance of All Saints'),
                      Divider(),
                      Text('John 7: 13-20'),
                      Text('Matthew 7: 13-20'),
                      Text('Luke 7: 13-20'),
                      Text('Mark 7: 13-20'),
                    ],
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
