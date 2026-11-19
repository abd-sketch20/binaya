import 'package:flutter/material.dart';

void main() {
  runApp(const BinayaApp());
}

class BinayaApp extends StatelessWidget {
  const BinayaApp({super.key});

  @override
  Widget build(BuildContext context) {
    const softSlateBg = Color(0xFF232730);
    const cardSlate = Color(0xFF2F3542);
    const machineryAmber = Color(0xFFF59E0B);
    const darkText = Color(0xFF14171D);

    return MaterialApp(
      title: 'بناية',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: softSlateBg,
        colorScheme: const ColorScheme.dark(
          primary: machineryAmber,
          secondary: machineryAmber,
          surface: cardSlate,
        ),
        useMaterial3: true,
      ),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child ?? const SizedBox.shrink(),
        );
      },
      home: const BinayaSimpleScreen(
        softSlateBg: softSlateBg,
        cardSlate: cardSlate,
        machineryAmber: machineryAmber,
        darkText: darkText,
      ),
    );
  }
}

class BinayaSimpleScreen extends StatefulWidget {
  final Color softSlateBg;
  final Color cardSlate;
  final Color machineryAmber;
  final Color darkText;

  const BinayaSimpleScreen({
    super.key,
    required this.softSlateBg,
    required this.cardSlate,
    required this.machineryAmber,
    required this.darkText,
  });

  @override
  State<BinayaSimpleScreen> createState() => _BinayaSimpleScreenState();
}

class _BinayaSimpleScreenState extends State<BinayaSimpleScreen> {
  String selectedFilter = 'الكل';

  final filters = [
    {'label': 'الكل', 'icon': Icons.grid_view_rounded},
    {'label': 'الأسمنت', 'icon': Icons.inventory_2_rounded},
    {'label': 'الحديد', 'icon': Icons.construction_rounded},
    {'label': 'الأبواب', 'icon': Icons.door_front_door_rounded},
  ];

  final items = [
    {
      'title': 'أسمنت',
      'subtitle': 'مكتب الخليج • كيس 50 كغم',
      'category': 'الأسمنت',
      'icon': Icons.inventory_2_rounded,
      'action': 'اتصال مباشر',
    },
    {
      'title': 'حديد تسليح 16 ملم',
      'subtitle': 'شركة الرافدين • طن',
      'category': 'الحديد',
      'icon': Icons.construction_rounded,
      'action': 'اتصال مباشر',
    },
    {
      'title': 'أبواب خارجية',
      'subtitle': 'معرض البصرة • قطعة',
      'category': 'الأبواب',
      'icon': Icons.door_front_door_rounded,
      'action': 'اتصال مباشر',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final visibleItems = selectedFilter == 'الكل'
        ? items
        : items.where((e) => e['category'] == selectedFilter).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.cardSlate,
        foregroundColor: widget.machineryAmber,
        centerTitle: true,
        elevation: 0,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.apartment_rounded, size: 28),
            SizedBox(width: 8),
            Text(
              'بناية',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 82,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final f = filters[index];
                final label = f['label'] as String;
                final icon = f['icon'] as IconData;
                final active = selectedFilter == label;

                return InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () => setState(() => selectedFilter = label),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: active ? widget.machineryAmber : widget.cardSlate,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: active ? widget.machineryAmber : Colors.white24,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          icon,
                          size: 24,
                          color: active ? widget.darkText : widget.machineryAmber,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          label,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: active ? widget.darkText : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: visibleItems.length,
              itemBuilder: (context, index) {
                final item = visibleItems[index];
                final icon = item['icon'] as IconData;

                return Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: widget.cardSlate,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: widget.machineryAmber.withOpacity(0.5)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 68,
                            height: 68,
                            decoration: BoxDecoration(
                              color: widget.machineryAmber.withOpacity(0.16),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: widget.machineryAmber),
                            ),
                            child: Icon(
                              icon,
                              size: 38,
                              color: widget.machineryAmber,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['title'] as String,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  item['subtitle'] as String,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: FilledButton.icon(
                          style: FilledButton.styleFrom(
                            backgroundColor: widget.machineryAmber,
                            foregroundColor: widget.darkText,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'تواصل مع: ${item['subtitle']}',
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.call_rounded, size: 22),
                          label: Text(
                            item['action'] as String,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
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
