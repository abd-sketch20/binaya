import 'package:flutter/material.dart';

void main() {
  runApp(const BinayaApp());
}

class BinayaApp extends StatelessWidget {
  const BinayaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'بناية',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E73BE)),
        useMaterial3: true,
      ),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child ?? const SizedBox.shrink(),
        );
      },
      home: const BinayaHomeScreen(),
    );
  }
}

class BinayaHomeScreen extends StatefulWidget {
  const BinayaHomeScreen({super.key});

  @override
  State<BinayaHomeScreen> createState() => _BinayaHomeScreenState();
}

class _BinayaHomeScreenState extends State<BinayaHomeScreen> {
  String selectedCategory = 'الكل';

  final categories = <String>[
    'الكل',
    'الأسمنت',
    'الحديد',
    'الأبواب',
  ];

  final materials = >[
    {
      'name': 'أسمنت مقاوم للكبريتات',
      'category': 'الأسمنت',
      'merchant': 'مكتب الخليج لمواد البناء',
      'unit': 'كيس 50 كغم',
      'price': 'متوفر الآن',
    },
    {
      'name': 'حديد تسليح قياس 16 ملم',
      'category': 'الحديد',
      'merchant': 'شركة الرافدين للحديد',
      'unit': 'طن',
      'price': 'تواصل للسعر',
    },
    {
      'name': 'أبواب حديد وكبس خارجية',
      'category': 'الأبواب',
      'merchant': 'معرض البصرة للأبواب',
      'unit': 'قطعة',
      'price': 'حسب القياس',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredItems = selectedCategory == 'الكل'
        ? materials
        : materials.where((item) => item['category'] == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'بناية',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E73BE),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: const Color(0xFFEAF3FC),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'مواد البناء والتجار',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'اختر القسم لعرض المواد المتوفرة والتجار بوضوح',
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 56,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final cat = categories[index];
                final isSelected = cat == selectedCategory;
                return ChoiceChip(
                  label: Text(
                    cat,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.black87,
                    ),
                  ),
                  selected: isSelected,
                  selectedColor: const Color(0xFF1E73BE),
                  onSelected: (_) {
                    setState(() {
                      selectedCategory = cat;
                    });
                  },
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                item['name']!,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEAF3FC),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                item['category']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1E73BE),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text('التاجر: ${item['merchant']!}', style: const TextStyle(fontSize: 15)),
                        const SizedBox(height: 4),
                        Text('الوحدة: ${item['unit']!}', style: const TextStyle(fontSize: 15)),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('تم اختيار: ${item['name']!} من ${item['merchant']!}'),
                                ),
                              );
                            },
                            icon: const Icon(Icons.call),
                            label: Text(
                              item['price']!,
                              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
