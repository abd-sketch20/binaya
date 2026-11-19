import 'package:flutter/material.dart';

void main() => runApp(const BinayaApp());

class BinayaApp extends StatelessWidget {
  const BinayaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'بناية',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF232730),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFF59E0B),
          secondary: Color(0xFFF59E0B),
          surface: Color(0xFF2F3542),
        ),
        useMaterial3: true,
      ),
      builder: (context, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: child ?? const SizedBox.shrink(),
      ),
      home: const BinayaAuthScreen(),
    );
  }
}

class BinayaAuthScreen extends StatefulWidget {
  const BinayaAuthScreen({super.key});
  @override
  State<BinayaAuthScreen> createState() => _BinayaAuthScreenState();
}

class _BinayaAuthScreenState extends State<BinayaAuthScreen> {
  static const bg = Color(0xFF232730);
  static const card = Color(0xFF2F3542);
  static const amber = Color(0xFFF59E0B);
  static const dark = Color(0xFF14171D);
  String role = 'مشتري / صاحب بناء';
  final phone = TextEditingController();

  @override
  void dispose() {
    phone.dispose();
    super.dispose();
  }

  void _go(String? via) {
    final p = phone.text.trim();
    final info = via != null ? '$role • $via' : '$role • ${p.isEmpty ? "0770 123 4567" : p}';
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BinayaSimpleScreen(roleLabel: role, sessionInfo: info),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final buyer = role == 'مشتري / صاحب بناء';
    final merchant = !buyer;
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Center(
                child: Container(
                  width: 82,
                  height: 82,
                  decoration: BoxDecoration(color: amber, borderRadius: BorderRadius.circular(20)),
                  child: const Icon(Icons.apartment_rounded, size: 46, color: dark),
                ),
              ),
              const SizedBox(height: 16),
              const Text('بناية', textAlign: TextAlign.center, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: amber)),
              const SizedBox(height: 8),
              const Text('السوق الإنشائي العراقي الأول لتوصيل ومبيعات مواد البناء والمقاولات', textAlign: TextAlign.center, style: TextStyle(fontSize: 15, color: Colors.white70)),
              const SizedBox(height: 26),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => setState(() => role = 'مشتري / صاحب بناء'),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(color: buyer ? amber : Colors.transparent, borderRadius: BorderRadius.circular(12)),
                          child: Text('مشتري / صاحب بناء', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: buyer ? dark : Colors.white)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () => setState(() => role = 'تاجر / مذخر مواد'),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(color: merchant ? amber : Colors.transparent, borderRadius: BorderRadius.circular(12)),
                          child: Text('تاجر / مذخر مواد', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: merchant ? dark : Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: dark, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
                  onPressed: () => _go('دخول Google'),
                  child: const Text('G  الدخول السريع باستخدام Google', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 20),
              const Center(child: Text('أو برقم الهاتف العراقي', style: TextStyle(color: Colors.white60))),
              const SizedBox(height: 14),
              Container(
                height: 54,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(14), border: Border.all(color: Colors.white24)),
                child: Row(
                  children: [
                    const Text('964+', style: TextStyle(color: amber, fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: phone,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                        decoration: const InputDecoration(hintText: '0770 123 4567', hintStyle: TextStyle(color: Colors.white38), border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                height: 52,
                child: FilledButton(
                  style: FilledButton.styleFrom(backgroundColor: amber, foregroundColor: dark, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
                  onPressed: () => _go(null),
                  child: const Text('متابعة والتسجيل ←', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
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
  final String roleLabel;
  final String sessionInfo;
  const BinayaSimpleScreen({super.key, this.roleLabel = 'مشتري / صاحب بناء', this.sessionInfo = 'مشتري / صاحب بناء'});
  @override
  State<BinayaSimpleScreen> createState() => _BinayaSimpleScreenState();
}

class _BinayaSimpleScreenState extends State<BinayaSimpleScreen> {
  static const bg = Color(0xFF232730);
  static const card = Color(0xFF2F3542);
  static const amber = Color(0xFFF59E0B);
  static const dark = Color(0xFF14171D);
  String filter = 'الكل';

  final filters = [
    {'label': 'الكل', 'icon': Icons.grid_view_rounded},
    {'label': 'الأسمنت', 'icon': Icons.inventory_2_rounded},
    {'label': 'الحديد', 'icon': Icons.construction_rounded},
    {'label': 'الأبواب', 'icon': Icons.door_front_door_rounded},
  ];

  final List<Map<String, dynamic>> items = [
    {'title': 'أسمنت', 'subtitle': 'مكتب الخليج • كيس 50 كغم', 'meta': 'البصرة • السعر: عند التواصل', 'category': 'الأسمنت', 'icon': Icons.inventory_2_rounded, 'action': 'اتصال مباشر'},
    {'title': 'حديد تسليح 16 ملم', 'subtitle': 'شركة الرافدين • طن', 'meta': 'البصرة • السعر: عند التواصل', 'category': 'الحديد', 'icon': Icons.construction_rounded, 'action': 'اتصال مباشر'},
    {'title': 'أبواب خارجية', 'subtitle': 'معرض البصرة • قطعة', 'meta': 'البصرة • السعر: عند التواصل', 'category': 'الأبواب', 'icon': Icons.door_front_door_rounded, 'action': 'اتصال مباشر'},
  ];

  IconData _iconFor(String c) => c == 'الأسمنت'
      ? Icons.inventory_2_rounded
      : c == 'الحديد'
          ? Icons.construction_rounded
          : Icons.door_front_door_rounded;

  void _addSheet() {
    final titleC = TextEditingController();
    final merchantC = TextEditingController();
    final unitC = TextEditingController();
    final priceC = TextEditingController();
    final cityC = TextEditingController(text: 'البصرة');
    String cat = 'الأسمنت';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: card,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setM) => Padding(
          padding: EdgeInsets.fromLTRB(16, 20, 16, MediaQuery.of(ctx).viewInsets.bottom + 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('إضافة مادة أو إعلان جديد', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: amber)),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: cat,
                  dropdownColor: bg,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(labelText: 'القسم', filled: true, fillColor: bg, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
                  items: const ['الأسمنت', 'الحديد', 'الأبواب'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                  onChanged: (v) { if (v != null) setM(() => cat = v); },
                ),
                const SizedBox(height: 10),
                TextField(controller: titleC, style: const TextStyle(color: Colors.white), decoration: InputDecoration(labelText: 'اسم المادة', filled: true, fillColor: bg, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
                const SizedBox(height: 10),
                TextField(controller: merchantC, style: const TextStyle(color: Colors.white), decoration: InputDecoration(labelText: 'اسم المكتب أو التاجر', filled: true, fillColor: bg, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
                const SizedBox(height: 10),
                TextField(controller: unitC, style: const TextStyle(color: Colors.white), decoration: InputDecoration(labelText: 'الوحدة', filled: true, fillColor: bg, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: priceC,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(labelText: 'السعر (اختياري)', hintText: 'اتركه فارغاً إن رغبت', hintStyle: const TextStyle(color: Colors.white38), filled: true, fillColor: bg, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: cityC,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(labelText: 'المدينة', filled: true, fillColor: bg, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                SizedBox(
                  height: 48,
                  child: FilledButton(
                    style: FilledButton.styleFrom(backgroundColor: amber, foregroundColor: dark, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    onPressed: () {
                      final t = titleC.text.trim();
                      if (t.isEmpty) return;
                      final mName = merchantC.text.trim().isEmpty ? 'مذخر بناية' : merchantC.text.trim();
                      final uName = unitC.text.trim().isEmpty ? 'حسب الطلب' : unitC.text.trim();
                      final cityName = cityC.text.trim().isEmpty ? 'البصرة' : cityC.text.trim();
                      final rawPrice = priceC.text.trim();
                      final priceText = rawPrice.isEmpty ? 'السعر: عند التواصل' : 'السعر: $rawPrice';
                      setState(() => items.insert(0, {
                        'title': t,
                        'subtitle': '$mName • $uName',
                        'meta': '$cityName • $priceText',
                        'category': cat,
                        'icon': _iconFor(cat),
                        'action': 'اتصال مباشر',
                      }));
                      Navigator.pop(ctx);
                    },
                    child: const Text('نشر المادة', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final list = filter == 'الكل' ? items : items.where((e) => e['category'] == filter).toList();
    final isMerchant = widget.roleLabel.contains('تاجر');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: card,
        foregroundColor: amber,
        centerTitle: true,
        title: const Text('بناية', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        actions: [
          if (isMerchant) IconButton(onPressed: _addSheet, icon: const Icon(Icons.add_circle_outline_rounded, size: 28)),
        ],
      ),
      floatingActionButton: isMerchant
          ? FloatingActionButton.extended(
              backgroundColor: amber,
              foregroundColor: dark,
              onPressed: _addSheet,
              icon: const Icon(Icons.add_rounded),
              label: const Text('إضافة مادة', style: TextStyle(fontWeight: FontWeight.bold)),
            )
          : null,
      body: Column(
        children: [
          Container(width: double.infinity, color: card.withOpacity(0.6), padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8), child: Text(widget.sessionInfo, style: const TextStyle(color: Colors.white70, fontSize: 13))),
          SizedBox(
            height: 78,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (ctx, i) {
                final f = filters[i];
                final lbl = f['label'] as String;
                final active = filter == lbl;
                return InkWell(
                  onTap: () => setState(() => filter = lbl),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(color: active ? amber : card, borderRadius: BorderRadius.circular(14), border: Border.all(color: active ? amber : Colors.white24)),
                    child: Row(
                      children: [
                        Icon(f['icon'] as IconData, size: 22, color: active ? dark : amber),
                        const SizedBox(width: 8),
                        Text(lbl, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: active ? dark : Colors.white)),
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
              itemCount: list.length,
              itemBuilder: (ctx, i) {
                final item = list[i];
                return Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(16), border: Border.all(color: amber.withOpacity(0.5))),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(width: 64, height: 64, decoration: BoxDecoration(color: amber.withOpacity(0.15), borderRadius: BorderRadius.circular(14), border: Border.all(color: amber)), child: Icon(item['icon'] as IconData, size: 36, color: amber)),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item['title'] as String, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                                const SizedBox(height: 6),
                                Text(item['subtitle'] as String, style: const TextStyle(fontSize: 15, color: Colors.white70)),
                                const SizedBox(height: 4),
                                Text(item['meta'] as String, style: const TextStyle(fontSize: 14, color: amber, fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: FilledButton.icon(
                          style: FilledButton.styleFrom(backgroundColor: amber, foregroundColor: dark, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تواصل مع: ${item['subtitle']} (${item['meta']})'))),
                          icon: const Icon(Icons.call_rounded),
                          label: Text(item['action'] as String, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
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
