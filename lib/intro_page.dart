import 'package:flutter/material.dart';
import 'storybook_page_flip.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.2,
            colors: [Colors.brown.shade800, Colors.black87],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '🌼 The Bee Went Back to the Flower Again 🌼',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'CloisterBlack',
                  fontSize: 36,
                  color: Colors.amberAccent,
                  shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: Colors.yellowAccent,
                      offset: Offset(0, 0),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StorybookPageFlip()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  textStyle: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                child: const Text('Start Reading'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
