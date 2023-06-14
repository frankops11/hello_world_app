import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter Functions'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh_rounded),
              onPressed: () {
                setState(() {
                  counter = 0;
                });
              },
            ),
          ],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$counter',
              style:
                  const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            Text(
              counter == 1 ? 'Click' : 'Clicks',
              style: const TextStyle(fontSize: 25),
            )
          ],
        )),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButtonCustom(
              icon: Icons.refresh,
              onPressed: () {
                setState(() {
                  counter = 0;
                });
              },
            ),
            const SizedBox(height: 16),
            FloatingActionButtonCustom(
                icon: Icons.plus_one,
                onPressed: () {
                  setState(() {
                    counter += 1;
                  });
                }),
            const SizedBox(height: 16),
            FloatingActionButtonCustom(
                icon: Icons.exposure_minus_1_outlined,
                onPressed: () => setState(() {
                      if (counter == 0) return;
                      counter = counter - 1;
                    })),
          ],
        ));
  }
}

class FloatingActionButtonCustom extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const FloatingActionButtonCustom(
      {super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
