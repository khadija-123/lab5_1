import 'package:flutter/material.dart';

class AnimatedContainerApp extends StatefulWidget {
  const AnimatedContainerApp({super.key});

  @override
  State<AnimatedContainerApp> createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  double width = 50;
  double height = 50;
  Color color = const Color.fromARGB(255, 76, 111, 175);
  BorderRadiusGeometry borderRadius = BorderRadius.circular(8);
  bool isExpanded = false;
  bool isTextVisible = true; // For controlling the text visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Feature'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedContainer to animate size, color, and border radius
            AnimatedContainer(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: color,
                borderRadius: borderRadius,
              ),
              duration: const Duration(seconds: 2),
              curve: Curves.bounceInOut,
            ),
            const SizedBox(height: 20),

            // ElevatedButton to trigger animation
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                  width = isExpanded ? 200 : 50;
                  height = isExpanded ? 200 : 50;
                  color = isExpanded
                      ? const Color.fromARGB(255, 244, 54, 158)
                      : const Color.fromARGB(255, 76, 86, 175);
                  borderRadius = isExpanded
                      ? BorderRadius.circular(50)
                      : BorderRadius.circular(8);
                });
              },
              child: const Text('Animate Container'),
            ),

            const SizedBox(height: 20),

            // AnimatedOpacity to animate the visibility of text
            AnimatedOpacity(
              opacity: isTextVisible ? 1.0 : 0.0,
              duration: const Duration(seconds: 2),
              child: const Text(
                'Hello World!',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),

            const SizedBox(height: 20),

            // Button to toggle the visibility of the text
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isTextVisible = !isTextVisible;
                });
              },
              child: const Text('Toggle Text Visibility'),
            ),
          ],
        ),
      ),
    );
  }
}
