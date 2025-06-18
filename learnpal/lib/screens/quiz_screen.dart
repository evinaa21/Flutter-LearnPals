import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F5FA),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverAppBar(
            backgroundColor: Color(0xFFF6F5FA),
            surfaceTintColor: Color(0xFFF6F5FA),
            pinned: true,
            centerTitle: false,
            title: Text(
              "Quiz Hub",
              style: TextStyle(
                color: Color(0xFF1E1E1E),
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStartQuizCard(context),
                  const SizedBox(height: 30),
                  _buildSectionHeader("Special Modes"),
                  const SizedBox(height: 16),
                  _buildAdaptivePracticeCard(),
                  const SizedBox(height: 30),
                  _buildSectionHeader("Recent Quizzes"),
                  const SizedBox(height: 16),
                  _buildQuizHistory(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStartQuizCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Start a New Quiz",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E1E1E),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Configure your practice session below.",
            style: TextStyle(fontSize: 14, color: Color(0xFF8A8A8E)),
          ),
          const SizedBox(height: 24),
          _buildDropdown("Category", Icons.category_outlined, [
            "All",
            "History",
            "Science",
          ]),
          const SizedBox(height: 16),
          _buildDropdown("Number of Questions", Icons.format_list_numbered, [
            "10",
            "25",
            "50",
          ]),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7B61FF),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text(
              "Start Quiz",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(String label, IconData icon, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E1E1E),
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: items.first,
          items:
              items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
          onChanged: (_) {},
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: const Color(0xFF8A8A8E)),
            filled: true,
            fillColor: const Color(0xFFF6F5FA),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xFF1E1E1E),
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildAdaptivePracticeCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF50E3C2).withOpacity(0.1),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          const Icon(Icons.track_changes, color: Color(0xFF50E3C2), size: 32),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Adaptive Practice",
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Focus on your weak spots.",
                  style: TextStyle(fontSize: 14, color: Color(0xFF8A8A8E)),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward, color: Color(0xFF50E3C2)),
        ],
      ),
    );
  }

  Widget _buildQuizHistory() {
    // Placeholder data
    final history = [
      {'category': 'History', 'score': 8, 'total': 10, 'date': 'June 17, 2025'},
      {'category': 'Science', 'score': 9, 'total': 10, 'date': 'June 16, 2025'},
    ];

    return Column(
      children:
          history.map((item) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF7B61FF).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.history_edu,
                      color: Color(0xFF7B61FF),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['category'] as String,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['date'] as String,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF8A8A8E),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "${item['score']}/${item['total']}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF34D399),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }
}
