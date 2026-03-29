//..lib/main.dart

import 'package:flutter/material.dart';

void main() {
  runApp(const WarehouseItemDetailsApp());
}

class WarehouseItemDetailsApp extends StatelessWidget {
  const WarehouseItemDetailsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'تفاصيل الصنف',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        useMaterial3: true,
        fontFamily: 'Tajawal', // خط عربي أنيق، اضفه للـ pubspec إذا أردت
      ),
      home: const ItemDetailsScreen(),
    );
  }
}

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل الصنف'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.edit_outlined), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ItemHeaderCard(),
            const SizedBox(height: 16),
            const InventoryStatusSection(),
            const SizedBox(height: 16),
            const ItemInfoSection(),
            const SizedBox(height: 16),
            const MovementHistorySection(),
          ],
        ),
      ),
    );
  }
}

class ItemHeaderCard extends StatelessWidget {
  const ItemHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[50],
      padding: const EdgeInsets.all(24.0),
      width: double.infinity,
      child: Column(
        children: [
          Icon(Icons.precision_manufacturing_outlined, size: 80, color: Colors.blueGrey[700]),
          const SizedBox(height: 16),
          const Text(
            'محرك كهربائي 3 فاز - 5 حصان',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text('SKU: EE-MOT-001', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class InventoryStatusSection extends StatelessWidget {
  const InventoryStatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        color: Colors.white,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              StatusWidget(label: 'الكمية الحالية', value: '14', color: Colors.blue),
              StatusWidget(label: 'حد الأمان', value: '5', color: Colors.orange),
              StatusWidget(label: 'الموقع', value: 'A-03', color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

class StatusWidget extends StatelessWidget {
  final String label, value;
  final Color color;

  const StatusWidget({super.key, required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }
}

class ItemInfoSection extends StatelessWidget {
  const ItemInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.category, color: Colors.blueGrey),
              title: Text('القسم'),
              trailing: Text('الكهربائيات الثقيلة'),
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.blueGrey),
              title: Text('المستودع الرئيسي'),
              trailing: Text('المربع 1'),
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.monetization_on, color: Colors.blueGrey),
              title: Text('سعر التكلفة'),
              trailing: Text('\$120.00'),
            ),
          ],
        ),
      ),
    );
  }
}

class MovementHistorySection extends StatelessWidget {
  const MovementHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('سجل الحركة (آخر 5 عمليات)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(onPressed: () {}, child: const Text('عرض الكل')),
            ],
          ),
          const SizedBox(height: 8),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              return const MovementTile();
            },
          ),
        ],
      ),
    );
  }
}

class MovementTile extends StatelessWidget {
  const MovementTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.swap_vert, color: Colors.grey),
      title: const Text('صرف مواد'),
      subtitle: const Text('بواسطة: محمد علي - 15 مارس'),
      trailing: const Text('-2', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    );
  }
}