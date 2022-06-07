import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Admin',
      debugShowCheckedModeBanner: false,
      color: Colors.indigo,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              FlutterLogo(
                size: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              KButton(
                text: "Brands",
                onTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              KButton(
                text: "Cars",
                color: Colors.pink,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KButton extends StatelessWidget {
  final Color color;
  final Function()? onTap;
  final String text;
  const KButton({
    Key? key,
    this.color = Colors.amber,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Ink(
          height: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          width: double.infinity,
          child: Center(
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
