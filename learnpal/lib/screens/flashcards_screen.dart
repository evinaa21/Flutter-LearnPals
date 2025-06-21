import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/flashcard.dart';
import '../providers/flashcard_provider.dart';
import '../widgets/create_flashcard_sheet.dart'; // Import the new widget
import 'dart:math' as math;

class FlashcardsScreen extends ConsumerStatefulWidget {
  const FlashcardsScreen({super.key});

  @override
  ConsumerState<FlashcardsScreen> createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends ConsumerState<FlashcardsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';
  bool _isGridView = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allFlashcards = ref.watch(flashcardsProvider);
    final flashcardSets = ref.watch(flashcardSetsProvider);

    final filteredCards =
        allFlashcards.where((card) {
          final query = _searchQuery.toLowerCase();
          return card.front.toLowerCase().contains(query) ||
              card.back.toLowerCase().contains(query) ||
              card.category.toLowerCase().contains(query);
        }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F5FA),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              _buildSliverAppBar(),
              SliverPersistentHeader(
                delegate: _SliverTabBarDelegate(
                  TabBar(
                    controller: _tabController,
                    labelColor: const Color(0xFF7B61FF),
                    unselectedLabelColor: const Color(0xFF8A8A8E),
                    indicatorColor: const Color(0xFF7B61FF),
                    indicatorWeight: 3,
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    tabs: const [Tab(text: 'All Cards'), Tab(text: 'Sets')],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              _buildFlashcardsView(filteredCards),
              _buildSetsView(flashcardSets),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateFlashcardSheet(), // Updated this line
        backgroundColor: const Color(0xFF7B61FF),
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 28),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: const Color(0xFFF6F5FA),
      surfaceTintColor: const Color(0xFFF6F5FA),
      pinned: true,
      floating: true,
      title: const Text(
        "My Library",
        style: TextStyle(
          color: Color(0xFF1E1E1E),
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(_isGridView ? Icons.view_list : Icons.grid_view),
          onPressed: () => setState(() => _isGridView = !_isGridView),
          color: const Color(0xFF1E1E1E),
        ),
        IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () {
            // TODO: Implement filter/sort bottom sheet
          },
          color: const Color(0xFF1E1E1E),
        ),
        const SizedBox(width: 8),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: TextField(
            onChanged: (value) => setState(() => _searchQuery = value),
            decoration: InputDecoration(
              hintText: 'Search your cards...',
              prefixIcon: const Icon(Icons.search, color: Color(0xFF8A8A8E)),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFlashcardsView(List<Flashcard> cards) {
    if (cards.isEmpty) {
      return _buildEmptyState(
        icon: Icons.style_outlined,
        title: "No Flashcards Yet",
        message: "Tap the '+' button to create your first flashcard.",
      );
    }
    return _isGridView ? _buildGridView(cards) : _buildListView(cards);
  }

  Widget _buildGridView(List<Flashcard> cards) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemCount: cards.length,
      itemBuilder: (context, index) => _buildGridCard(cards[index]),
    );
  }

  Widget _buildListView(List<Flashcard> cards) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: cards.length,
      itemBuilder: (context, index) => _buildListCard(cards[index]),
    );
  }

  Widget _buildGridCard(Flashcard card) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            card.category,
            style: const TextStyle(
              color: Color(0xFF7B61FF),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Text(
            card.front,
            style: const TextStyle(
              color: Color(0xFF1E1E1E),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMiniStat(Icons.replay, '${card.timesReviewed}'),
              _buildMiniStat(
                Icons.check_circle_outline,
                '${(card.correctAnswers / math.max(1, card.timesReviewed) * 100).toInt()}%',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildListCard(Flashcard card) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFF7B61FF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.style, color: Color(0xFF7B61FF), size: 32),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  card.front,
                  style: const TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  card.category,
                  style: const TextStyle(
                    color: Color(0xFF8A8A8E),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF8A8A8E),
            size: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildMiniStat(IconData icon, String value) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.grey.shade500),
        const SizedBox(width: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildSetsView(List<FlashcardSet> sets) {
    if (sets.isEmpty) {
      return _buildEmptyState(
        icon: Icons.folder_open_outlined,
        title: "No Sets Created",
        message: "Group your cards into sets for better organization.",
      );
    }
    // TODO: Build the list/grid for sets
    return const Center(child: Text("Sets view coming soon!"));
  }

  Widget _buildEmptyState({
    required IconData icon,
    required String title,
    required String message,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 60, color: Colors.grey.shade400),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E1E1E),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Color(0xFF8A8A8E)),
          ),
        ],
      ),
    );
  }

  void _showCreateFlashcardSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => const CreateFlashcardSheet(),
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverTabBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: const Color(0xFFF6F5FA), child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return false;
  }
}
