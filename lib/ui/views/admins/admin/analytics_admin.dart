import 'package:digitalcaryard/ui/common/apihelper/apihelper.dart';
import 'package:flutter/material.dart';

class AnalyticsAdmin extends StatefulWidget {
  const AnalyticsAdmin({super.key});

  @override
  State<AnalyticsAdmin> createState() => _AnalyticsAdminState();
}

class _AnalyticsAdminState extends State<AnalyticsAdmin> {
  int userCount = 0;
  int carCount = 0;
  int productCount = 0;
  bool isLoading = true;

  final Color primaryColor = const Color(0xFF00CCFF);

  @override
  void initState() {
    super.initState();
    fetchCounts();
  }

  Future<void> fetchCounts() async {
    final users = await ApiHelper.allUsers();
    final cars = await ApiHelper.allCar();
    final products = await ApiHelper.allProducts();

    setState(() {
      userCount = users.length;
      carCount = cars.length;
      productCount = products.length;
      isLoading = false;
    });
  }

  Widget buildCard(String title, int count, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 1.5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 40),
          const SizedBox(height: 10),
          Text(
            '$count',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: color,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Admin Analytics"),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: primaryColor,
        elevation: 0,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.white))
          : LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = constraints.maxWidth < 600 ? 2 : 3;

                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: GridView.count(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 2.2,
                    children: [
                      buildCard("All Users", userCount, Icons.person,
                          Colors.blueAccent),
                      buildCard("All Cars", carCount, Icons.directions_car,
                          Colors.greenAccent),
                      buildCard("All Products", productCount,
                          Icons.shopping_bag, Colors.deepPurpleAccent),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
