import 'package:flutter/material.dart';
import 'package:test_app/Provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    ChangeNotifierProvider(create: (context) => Data(), child: new MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<Data>(context);
    return new MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // date picker start
              providerData.date == null
                  ? Text('Choose data')
                  : Text(providerData.date.toString()),
              Pick(),
              // date picker end
              // time picker start
              PickDate(),
              providerData.time == null
                  ? Text('Choose time')
                  : Text(
                      '${providerData.time.hour}:${providerData.time.minute}'),
              // time picker end
            ],
          ),
        ),
      ),
    );
  }
}

class Pick extends StatefulWidget {
  @override
  State<Pick> createState() => _PickState();
}

class _PickState extends State<Pick> {
  DateTime date;
  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<Data>(context);
    return Container(
      child: ElevatedButton(
          onPressed: () async {
            final DateTime picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year - 20),
                lastDate: DateTime(DateTime.now().year + 2));
            providerData.setDate(picked);
          },
          child: Text('Select Data')),
    );
  }
}

class PickDate extends StatefulWidget {
  @override
  State<PickDate> createState() => _PickDateState();
}

class _PickDateState extends State<PickDate> {
  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<Data>(context);
    return Container(
        child: ElevatedButton(
      onPressed: () async {
        TimeOfDay time = await showTimePicker(
            context: context, initialTime: TimeOfDay.now());
        providerData.setTime(time);
      },
      child: Text('pick date'),
    ));
  }
}
