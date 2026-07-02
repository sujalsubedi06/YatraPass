import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../data/onboarding_data.dart';
import '../widgets/onboarding_bottom_bar.dart';
import '../widgets/onboarding_content.dart';
import '../widgets/onboarding_image.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      context.go(AppRoutes.welcome);
    }
  }

  void _skip() {
    _pageController.animateToPage(
      onboardingPages.length - 1,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: OnboardingBottomBar(
            currentPage: _currentPage,
            pageCount: onboardingPages.length,
            onSkip: _skip,
            onNext: _nextPage,
          ),
        ),
      ),
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemCount: onboardingPages.length,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          itemBuilder: (context, index) {
            final page = onboardingPages[index];

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 30, 24, 140),
                child: Column(
                  children: [
                    OnboardingImage(
                      image: page.image,
                    ),

                    const SizedBox(height: 24),

                    OnboardingContent(
                      title: page.title,
                      description: page.description,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}