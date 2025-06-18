import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/flashcard.dart';
import 'screens/flashcards_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/profile_screen.dart'; // Import the new screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive for local storage
  await Hive.initFlutter();

  // Register Hive adapters (you'll need to generate these)
  // Hive.registerAdapter(FlashcardAdapter());
  // Hive.registerAdapter(FlashcardSetAdapter());

  // Open boxes
  await Hive.openBox<Flashcard>('flashcards');
  await Hive.openBox<FlashcardSet>('flashcard_sets');

  // TODO: Initialize Supabase (add your credentials later)
  // await Supabase.initialize(
  //   url: 'YOUR_SUPABASE_URL',
  //   anonKey: 'YOUR_SUPABASE_ANON_KEY',
  // );

  runApp(const ProviderScope(child: LearnPalApp()));
}

class LearnPalApp extends StatelessWidget {
  const LearnPalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LearnPal - AI Study Companion',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF6F5FA),
        fontFamily: 'Poppins', // Example font, add it to pubspec.yaml
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const FlashcardsScreen(),
    const QuizScreen(),
    const ProfileScreen(), // This now refers to your new screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 20,
          ),
        ],
      ),
      child: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: const Color(0xFF7B61FF).withOpacity(0.1),
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (Set<MaterialState> states) =>
                states.contains(MaterialState.selected)
                    ? const TextStyle(
                      color: Color(0xFF7B61FF),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    )
                    : const TextStyle(
                      color: Color(0xFF8A8A8E),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
          ),
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.home, color: Color(0xFF7B61FF)),
              icon: Icon(Icons.home_outlined, color: Color(0xFF8A8A8E)),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.style, color: Color(0xFF7B61FF)),
              icon: Icon(Icons.style_outlined, color: Color(0xFF8A8A8E)),
              label: 'Flashcards',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.quiz, color: Color(0xFF7B61FF)),
              icon: Icon(Icons.quiz_outlined, color: Color(0xFF8A8A8E)),
              label: 'Quiz',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person, color: Color(0xFF7B61FF)),
              icon: Icon(Icons.person_outline, color: Color(0xFF8A8A8E)),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
