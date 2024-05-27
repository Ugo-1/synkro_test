import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:synkro_test/utils/constants.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> with TickerProviderStateMixin {
  int subjectIndex = 0;
  final List<String> subjects = [
    'Mathematics',
    'Chemistry',
    'Statistics',
    'Physics',
    'F/Maths',
  ];
  final List<String> topics = [
    'Algebraic Identities',
    'Arithmetic Progression',
    'Binomial Series',
    'Compound and simple interest',
    'Cosine and sine rule',
    'Decimal Places',
    'Factorial',
    'Geometric Progression',
    'Indices',
    'Longitude and latitude',
    'Linear Equation',
    'Logarithm',
    'Matrices',
    'Mensuration',
    'Partial Fraction',
    'Percentages',
    'Permutation and Combination',
    'Pre-Algebra',
    'Prime Numbers',
    'Polynomials',
    'Pythagoras Theorem',
    'Quadratic Equations',
    'Simultaneous Linear Equations',
    'Surd Operations',
  ];
  late TabController _tabController;
  late TabController _bottomTabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: subjects.length,
      vsync: this,
    );
    _bottomTabController = TabController(
      length: 5,
      vsync: this,
      initialIndex: 2,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _bottomTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFE6EDE7),
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            kIMenu,
            height: 32,
            width: 32,
          ),
        ),
        leadingWidth: 45,
        title: SizedBox(
          height: 40,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.search_rounded,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'Search any topic or subject',
                      style: textTheme.labelSmall?.copyWith(
                        color: const Color(0xFFACACAC),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Search'),
                  ),
                ],
              ),
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              kISortDown,
              height: 32,
              width: 32,
            ),
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              title: Container(
                margin: const EdgeInsets.fromLTRB(14, 16, 14, 7),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: colorScheme.primary),
                  color: const Color(0xFFE6EDE7),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      kICheck,
                      height: 24,
                      width: 24,
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        'First, select a subject then select a topic or search for it.',
                        style: textTheme.labelLarge?.copyWith(
                          color: const Color(0xFF353535),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.cancel,
                      size: 24,
                      color: colorScheme.primary,
                    ),
                  ],
                ),
              ),
              bottom: TabBar(
                controller: _tabController,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                tabs: subjects.map((String name) => Tab(text: name)).toList(),
                labelStyle: textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                labelColor: colorScheme.primary,
                unselectedLabelStyle: textTheme.labelLarge,
                unselectedLabelColor: const Color(0xFF353535),
              ),
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: subjects.map((String name) {
            return SafeArea(
              top: false,
              bottom: false,
              child: Builder(
                builder: (BuildContext context) {
                  return CustomScrollView(
                    key: PageStorageKey<String>(name),
                    slivers: <Widget>[
                      SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 17,
                        ),
                        sliver: SliverGrid.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 60,
                            mainAxisSpacing: 6,
                            crossAxisSpacing: 19,
                          ),
                          itemCount: topics.length,
                          itemBuilder: (_, index) => DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFACACAC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: Text(
                                  topics[index],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.bodyLarge?.copyWith(
                                    color: const Color(0xFF636363),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xFFEDEDED),
            ),
          ),
        ),
        child: TabBar(
          indicatorPadding: const EdgeInsets.only(bottom: 5),
          labelPadding: const EdgeInsets.all(0),
          controller: _bottomTabController,
          labelStyle: textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.w500,
          ),
          labelColor: colorScheme.primary,
          unselectedLabelColor: const Color(0xFF6F6F6F),
          tabs: [
            Tab(
              icon: SvgPicture.asset(kIHome),
              text: 'Home',
            ),
            Tab(
              icon: SvgPicture.asset(kICamera),
              text: 'Camera',
            ),
            Tab(
              icon: SvgPicture.asset(kICalculator),
              text: 'Calculator',
            ),
            Tab(
              icon: SvgPicture.asset(kILearn),
              text: 'Learn',
            ),
            Tab(
              icon: SvgPicture.asset(kICommunity),
              text: 'Community',
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: (index){},
      //   currentIndex: 2,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: icon,
      //     ),
      //   ],
      // ),
      // bottomNavigationBar: NavigationBar(
      //     onDestinationSelected: (int index) {},
      //     indicatorColor: Colors.pink,
      //   indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      //     selectedIndex: 2,
      //     destinations: <Widget>[
      //       NavigationDestination(
      //         //selectedIcon: Icon(Icons.home),
      //         icon: SvgPicture.asset(kIHome),
      //         label: 'Home',
      //       ),
      //       NavigationDestination(
      //         icon: SvgPicture.asset(kICamera),
      //         label: 'Camera',
      //       ),
      //       NavigationDestination(
      //         icon: SvgPicture.asset(kICalculator),
      //         label: 'Calculator',
      //       ),
      //     ],
      //   ),
    );
  }
}
