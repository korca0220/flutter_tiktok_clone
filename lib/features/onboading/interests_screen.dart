import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import 'tutorial_screen.dart';
import 'widgets/interest_button.dart';

const interests = [
  'Daily Life',
  'Comedy',
  'Entertainment',
  'Animals',
  'Food',
  'Beauty & Style',
  'Drama',
  'Learning',
  'Talent',
  'Sports',
  'Auto',
  'Family',
  'Fitness & Health',
  'DIY & Life Hacks',
  'Arts & Crafts',
  'Dance',
  'Outdoors',
  'Oddly Satisfying',
  'Home & Garden',
  'Daily Life',
  'Comedy',
  'Entertainment',
  'Animals',
  'Food',
  'Beauty & Style',
  'Drama',
  'Learning',
  'Talent',
  'Sports',
  'Auto',
  'Family',
  'Fitness & Health',
  'DIY & Life Hacks',
  'Arts & Crafts',
  'Dance',
  'Outdoors',
  'Oddly Satisfying',
  'Home & Garden',
];

class InterestsScreen extends StatefulWidget {
  static const String routeName = 'interests';
  static const String routeURL = '/tutorial';
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final _scrollController = ScrollController();

  bool _showTitle = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 100) {
      if (_showTitle) return;
      setState(() {
        _showTitle = true;
      });
    } else {
      setState(() {
        _showTitle = false;
      });
    }
  }

  void _onNextTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TutorialScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
          opacity: _showTitle ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: const Text('Choose your interests'),
        ),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.only(
              left: Sizes.size24,
              right: Sizes.size24,
              bottom: Sizes.size16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Choose your interests',
                  style: TextStyle(
                    fontSize: Sizes.size36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v20,
                const Text(
                  'Get better video recommendations',
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Gaps.v32,
                Wrap(
                  // 세로
                  runSpacing: 15,
                  // 가로
                  spacing: 15,
                  children: [
                    for (var interest in interests)
                      InterestButton(interest: interest),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: Sizes.size32,
            top: Sizes.size16,
            left: Sizes.size24,
            right: Sizes.size24,
          ),
          child: CupertinoButton(
            color: Theme.of(context).primaryColor,
            onPressed: _onNextTap,
            child: const Text('Next'),
          ),
        ),
      ),
    );
  }
}
