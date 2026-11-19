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
      home: const BinayaAuthScreen(
        softSlateBg: softSlateBg,
        cardSlate: cardSlate,
        machineryAmber: machineryAmber,
        darkText: darkText,
      ),
    );
  }
}

class ThreeStoryBuildingBadge extends StatelessWidget {
  final Color color;
  final double size;

  const ThreeStoryBuildingBadge({
    super.key,
    required this.color,
    this.size = 34,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: size * 0.48,
            height: size * 0.22,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 1.5),
          Container(
            width: size * 0.68,
            height: size * 0.24,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 1.5),
          Container(
            width: size * 0.88,
            height: size * 0.28,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}

class BinayaAuthScreen extends StatefulWidget {
  final Color softSlateBg;
  final Color cardSlate;
  final Color machineryAmber;
  final Color darkText;

  const BinayaAuthScreen({
    super.key,
    required this.softSlateBg,
    required this.cardSlate,
    required this.machineryAmber,
    required this.darkText,
  });

  @override
  State<BinayaAuthScreen> createState() => _BinayaAuthScreenState();
}

class _BinayaAuthScreenState extends State<BinayaAuthScreen> {
  String selectedRole = 'مشتري / صاحب بناء';
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void _openHome({String? authMethod}) {
    final phoneText = phoneController.text.trim();
    final infoText = authMethod != null
        ? '$selectedRole • $authMethod'
        : '$selectedRole • ${phoneText.isEmpty ? "0770 123 4567" : phoneText}';

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BinayaSimpleScreen(
          softSlateBg: widget.softSlateBg,
          cardSlate: widget.cardSlate,
          machineryAmber: widget.machineryAmber,
          darkText: widget.darkText,
          roleLabel: selectedRole,
          sessionInfo: infoText,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isBuyer = selectedRole == 'مشتري / صاحب بناء';
    final isMerchant = selectedRole == 'تاجر / مذخر مواد';

    return Scaffold(
      backgroundColor: widget.softSlateBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12),
              Center(
                child: Container(
                  width: 84,
                  height: 84,
                  decoration: BoxDecoration(
                    color: widget.machineryAmber,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: ThreeStoryBuildingBadge(
                      color: widget.darkText,
                      size: 46,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'بناية',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: widget.machineryAmber,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'السوق الإنشائي العراقي الأول لتوصيل ومبيعات مواد البناء والمقاولات',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 28),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: widget.cardSlate,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => setState(() => selectedRole = 'مشتري / صاحب بناء'),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 8),
                          decoration: BoxDecoration(
                            color: isBuyer ? widget.machineryAmber : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.home_work_rounded,
                                size: 19,
                                color: isBuyer ? widget.darkText : Colors.white70,
                              ),
                              const SizedBox(width: 6),
                              Flexible(
                                child: Text(
                                  'مشتري / صاحب بناء',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.bold,
                                    color: isBuyer ? widget.darkText : Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => setState(() => selectedRole = 'تاجر / مذخر مواد'),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 8),
                          decoration: BoxDecoration(
                            color: isMerchant ? widget.machineryAmber : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.storefront_rounded,
                                size: 19,
                                color: isMerchant ? widget.darkText : widget.machineryAmber,
                              ),
                              const SizedBox(width: 6),
                              Flexible(
                                child: Text(
                                  'تاجر / مذخر مواد',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.bold,
                                    color: isMerchant ? widget.darkText : Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: widget.darkText,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () => _openHome(authMethod: 'دخول Google'),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'G',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFEA4335),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'الدخول السريع باستخدام Google',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 22),
              const Row(
                children: [
                  Expanded(child: Divider(color: Colors.white24)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'أو برقم الهاتف العراقي',
                      style: TextStyle(color: Colors.white60, fontSize: 13.5),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.white24)),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                height: 56,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: widget.cardSlate,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.white24),
                ),
                child: Row(
                  children: [
                    Text(
                      '964+',
                      style: TextStyle(
                        color: widget.machineryAmber,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(width: 1, height: 24, color: Colors.white24),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                        decoration: const InputDecoration(
                          hintText: '0770 123 4567',
                          hintStyle: TextStyle(color: Colors.white38),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                height: 54,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: widget.machineryAmber,
                    foregroundColor: widget.darkText,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () => _openHome(),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'متابعة والتسجيل',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward_rounded, size: 22),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BinayaSimpleScreen extends StatefulWidget {
  final Color softSlateBg;
  final Color cardSlate;
  final Color machineryAmber;
  final Color darkText;
  final String roleLabel;
  final String sessionInfo;

  const BinayaSimpleScreen({
    super.key,
    required this.softSlateBg,
    required this.cardSlate,
    required this.machineryAmber,
    required this.darkText,
    this.roleLabel = 'مشتري / صاحب بناء',
    this.sessionInfo = 'مشتري / صاحب بناء',
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

  final List> items = [
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

  IconData _categoryIcon(String category) {
    switch (category) {
      case 'الأسمنت':
        return Icons.inventory_2_rounded;
      case 'الحديد':
        return Icons.construction_rounded;
      case 'الأبواب':
        return Icons.door_front_door_rounded;
      default:
        return Icons.grid_view_rounded;
    }
  }

  void _openAddListingSheet() {
    final titleCtrl = TextEditingController();
    final merchantCtrl = TextEditingController();
    final unitCtrl = TextEditingController();
    String chosenCategory = 'الأسمنت';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: widget.cardSlate,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'إضافة مادة أو إعلان جديد',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: widget.machineryAmber,
                    ),
                  ),
                  const SizedBox(height: 14),
                  DropdownButtonFormField<String>(
                    value: chosenCategory,
                    dropdownColor: widget.softSlateBg,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    decoration: InputDecoration(
                      labelText: 'القسم',
                      labelStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: widget.softSlateBg,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    items: const ['الأسمنت', 'الحديد', 'الأبواب']
                        .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                        .toList(),
                    onChanged: (val) {
                      if (val != null) setModalState(() => chosenCategory = val);
                    },
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: titleCtrl,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'اسم المادة',
                      labelStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: widget.softSlateBg,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: merchantCtrl,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'اسم المكتب أو التاجر',
                      labelStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: widget.softSlateBg,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: unitCtrl,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'الوحدة',
                      labelStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: widget.softSlateBg,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 50,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: widget.machineryAmber,
                        foregroundColor: widget.darkText,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        final title = titleCtrl.text.trim();
                        if (title.isEmpty) return;
                        final merchant = merchantCtrl.text.trim().isEmpty
                            ? 'مذخر بناية'
                            : merchantCtrl.text.trim();
                        final unit = unitCtrl.text.trim().isEmpty
                            ? 'حسب الطلب'
                            : unitCtrl.text.trim();

                        setState(() {
                          items.insert(0, {
                            'title': title,
                            'subtitle': '$merchant • $unit',
                            'category': chosenCategory,
                            'icon': _categoryIcon(chosenCategory),
                            'action': 'اتصال مباشر',
                          });
                        });
                        Navigator.pop(ctx);
                      },
                      child: const Text(
                        'نشر المادة',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final visibleItems = selectedFilter == 'الكل'
        ? items
        : items.where((e) => e['category'] == selectedFilter).toList();
    final isMerchant = widget.roleLabel.contains('تاجر');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.cardSlate,
        foregroundColor: widget.machineryAmber,
        centerTitle: true,
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ThreeStoryBuildingBadge(color: widget.machineryAmber, size: 30),
            const SizedBox(width: 10),
            const Text(
              'بناية',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          if (isMerchant)
            IconButton(
              tooltip: 'إضافة مادة',
              onPressed: _openAddListingSheet,
              icon: const Icon(Icons.add_circle_outline_rounded, size: 28),
            ),
        ],
      ),
      floatingActionButton: isMerchant
          ? FloatingActionButton.extended(
              backgroundColor: widget.machineryAmber,
              foregroundColor: widget.darkText,
              onPressed: _openAddListingSheet,
              icon: const Icon(Icons.add_rounded),
              label: const Text(
                'إضافة مادة',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          : null,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: widget.cardSlate.withOpacity(0.6),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Text(
              widget.sessionInfo,
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ),
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
