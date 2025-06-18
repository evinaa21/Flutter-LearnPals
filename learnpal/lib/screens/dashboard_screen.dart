import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/flashcard.dart';
import '../providers/flashcard_provider.dart';
import 'dart:math' as math;

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final flashcards = ref.watch(flashcardsProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F5FA),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                _buildHeader(),
                const SizedBox(height: 30),
                _buildMissionControlCard(flashcards),
                const SizedBox(height: 30),
                _buildSectionHeader("Quick Actions", () {}),
                const SizedBox(height: 16),
                _buildQuickActionsGrid(),
                const SizedBox(height: 30),
                _buildSectionHeader("Continue Learning", () {}),
                const SizedBox(height: 16),
                _buildRecentActivity(flashcards),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/men/32.jpg',
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back,",
                  style: TextStyle(
                    color: Color(0xFF8A8A8E),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Mike Lewis",
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        _buildHeaderIcon(Icons.notifications_outlined),
      ],
    );
  }

  Widget _buildMissionControlCard(List<Flashcard> flashcards) {
    final mastery = _calculateMastery(flashcards);
    final missions = _generateDailyMissions(flashcards);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF7B61FF), Color(0xFF6249E3)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7B61FF).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "A+ Mission Control",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "Your personalized path to success.",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 24),
          _buildMasteryProgress(mastery),
          const SizedBox(height: 24),
          const Divider(color: Colors.white24),
          const SizedBox(height: 16),
          ...missions.map((mission) => _buildMissionItem(mission)).toList(),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF7B61FF),
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text(
              "Launch All Missions",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMasteryProgress(double mastery) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                value: mastery,
                strokeWidth: 8,
                backgroundColor: Colors.white.withOpacity(0.2),
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Color(0xFF34D399),
                ),
              ),
              Center(
                child: Text(
                  "${(mastery * 100).toInt()}%",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Overall Mastery",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "You're on the right track. Keep up the great work!",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMissionItem(Map<String, dynamic> mission) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(mission['icon'], color: Colors.white, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mission['title'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  mission['subtitle'],
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.2,
      children: [
        _buildActionCard(
          "Review Due",
          "Spaced Repetition",
          Icons.replay_circle_filled,
          const Color(0xFF4A90E2),
        ),
        _buildActionCard(
          "New Quiz",
          "Test Your Knowledge",
          Icons.quiz,
          const Color(0xFF50E3C2),
        ),
        _buildActionCard(
          "Create Card",
          "Add to Your Library",
          Icons.add_circle,
          const Color(0xFFF5A623),
        ),
        _buildActionCard(
          "Generate AI",
          "From Notes or Docs",
          Icons.auto_awesome,
          const Color(0xFFBD10E0),
        ),
      ],
    );
  }

  Widget _buildActionCard(
    String title,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(color: color.withOpacity(0.8), fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivity(List<Flashcard> flashcards) {
    // Simulate recently studied sets by grouping cards by category
    final recentSets =
        flashcards.map((e) => e.category).toSet().take(3).toList();

    if (recentSets.isEmpty) {
      return _buildEmptyRecentActivity();
    }

    return Column(
      children:
          recentSets
              .map((category) => _buildRecentActivityCard(category, flashcards))
              .toList(),
    );
  }

  Widget _buildRecentActivityCard(
    String category,
    List<Flashcard> allFlashcards,
  ) {
    final cardsInCategory =
        allFlashcards.where((c) => c.category == category).toList();
    final cardsMastered =
        cardsInCategory.where((c) => c.correctAnswers > 2).length;
    final progress =
        cardsInCategory.isEmpty ? 0.0 : cardsMastered / cardsInCategory.length;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 6,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color(0xFF7B61FF),
                  ),
                ),
                Center(
                  child: Text(
                    "${(progress * 100).toInt()}%",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7B61FF),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E1E1E),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${cardsInCategory.length} cards • $cardsMastered mastered",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF8A8A8E),
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.play_arrow, color: Color(0xFF7B61FF), size: 28),
        ],
      ),
    );
  }

  Widget _buildEmptyRecentActivity() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: const Column(
        children: [
          Icon(Icons.school_outlined, size: 40, color: Color(0xFF8A8A8E)),
          SizedBox(height: 16),
          Text(
            "No recent activity",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E1E1E),
            ),
          ),
          SizedBox(height: 4),
          Text(
            "Start a quiz or review some cards to see your progress here.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Color(0xFF8A8A8E)),
          ),
        ],
      ),
    );
  }

  // --- AI Logic Simulation ---
  double _calculateMastery(List<Flashcard> cards) {
    if (cards.isEmpty) return 0.0;
    double totalScore = 0;
    int totalReviews = 0;
    for (var card in cards) {
      totalScore += card.correctAnswers;
      totalReviews += card.timesReviewed;
    }
    return totalReviews == 0 ? 0.0 : totalScore / totalReviews;
  }

  List<Map<String, dynamic>> _generateDailyMissions(List<Flashcard> cards) {
    final List<Map<String, dynamic>> missions = [];
    final dueCards =
        cards
            .where((c) => DateTime.now().difference(c.lastReviewed).inDays > 3)
            .toList();
    if (dueCards.isNotEmpty) {
      missions.add({
        'icon': Icons.replay,
        'title': 'Strengthen Memory',
        'subtitle': 'Review ${dueCards.length} cards due today',
      });
    }
    final categoryScores = <String, List<double>>{};
    for (var card in cards) {
      if (card.timesReviewed > 0) {
        categoryScores.putIfAbsent(card.category, () => []);
        categoryScores[card.category]!.add(
          card.correctAnswers / card.timesReviewed,
        );
      }
    }
    String? weakestCategory;
    double lowestScore = 1.1;
    categoryScores.forEach((category, scores) {
      final avg = scores.reduce((a, b) => a + b) / scores.length;
      if (avg < lowestScore) {
        lowestScore = avg;
        weakestCategory = category;
      }
    });
    if (weakestCategory != null && lowestScore < 0.7) {
      missions.add({
        'icon': Icons.track_changes,
        'title': 'Target Weakness',
        'subtitle': 'Focus on your toughest topic: $weakestCategory',
      });
    }
    final newCards = cards.where((c) => c.timesReviewed < 2).toList();
    if (newCards.isNotEmpty) {
      missions.add({
        'icon': Icons.explore,
        'title': 'Learn New Concepts',
        'subtitle': 'Master ${math.min(5, newCards.length)} new cards',
      });
    }
    if (missions.isEmpty && cards.isNotEmpty) {
      missions.add({
        'icon': Icons.check_circle,
        'title': 'All Caught Up!',
        'subtitle': 'Great job! Review any topic you like.',
      });
    } else if (cards.isEmpty) {
      missions.add({
        'icon': Icons.add,
        'title': 'Start Your Journey',
        'subtitle': 'Create your first flashcard to begin!',
      });
    }
    return missions.take(3).toList();
  }

  // --- UNCHANGED WIDGETS ---
  Widget _buildHeaderIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Icon(icon, color: const Color(0xFF1E1E1E), size: 24),
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onSeeAll) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF1E1E1E),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: onSeeAll,
          child: const Row(
            children: [
              Text(
                "See All",
                style: TextStyle(
                  color: Color(0xFF7B61FF),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 4),
              Icon(Icons.arrow_forward_ios, size: 14, color: Color(0xFF7B61FF)),
            ],
          ),
        ),
      ],
    );
  }
}
