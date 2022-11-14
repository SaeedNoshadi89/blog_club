import 'package:blog_club/data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const defaultFontFamily = 'Avenir';

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secondaryTextColor = Color(0xff2D4379);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
              subtitle1: TextStyle(
                fontFamily: defaultFontFamily,
                fontSize: 15,
                color: secondaryTextColor,
              ),
              headline6: TextStyle(
                  fontFamily: defaultFontFamily, fontWeight: FontWeight.bold),
              bodyText2: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontSize: 14,
                  color: secondaryTextColor))),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final stories = LocalData.stories;
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hi, Saeed Noshadi",
                  style: themeData.textTheme.subtitle1,
                ),
                Image.asset(
                  'assets/img/icons/notification.png',
                  width: 24,
                  height: 24,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 0, 24),
            child: Text(
              'Explore today’s',
              style: themeData.textTheme.headline6,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length,
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              itemBuilder: (context, index) {
                final story = stories[index];
                return Container(
                  margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    colors: [
                                      Color(0xff376AED),
                                      Color(0xff49B0E2),
                                      Color(0xff9CECFB),
                                    ])),
                            child: Container(
                              margin: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              padding: const EdgeInsets.all(4),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                      'assets/img/stories/${story.imageFileName}')),
                            ),
                          ),
                          Positioned(
                            bottom: -3,
                            right: -3,
                            child: Image.asset(
                              'assets/img/icons/${story.iconFileName}',
                              width: 24,
                              height: 24,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        story.name,
                        style: themeData.textTheme.bodyText2,
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      )),
    );
  }
}
