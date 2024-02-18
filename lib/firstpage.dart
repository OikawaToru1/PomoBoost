import 'package:flutter/material.dart';
import 'package:pomoboost/pomodoro_homepage.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('asset/test.jpg'), fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Text(
              " PomoBoost. ",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.indigo.shade100,
                  background: Paint()),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              " Unleash peak productivity effortlessly.",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              "Boost your focus and productivity with our Pomodoro technique",
              maxLines: 2,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 122,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PomoHomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue.shade100,
                onPrimary: Colors.black,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Let's Get Started"),
            ),
          ],
        ),
      ),
    );
  }
}
