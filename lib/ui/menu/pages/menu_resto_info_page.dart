import 'package:flutter/material.dart';
import 'package:flutter_pos_app/data/models/menu_resto_model.dart';

class MenuRestoInfoPage extends StatefulWidget {
  final MenuRestoModel menu;

  const MenuRestoInfoPage({super.key, required this.menu});

  @override
  State<MenuRestoInfoPage> createState() => _MenuRestoInfoPageState();
}

class _MenuRestoInfoPageState extends State<MenuRestoInfoPage> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        widget.menu.imageMenu?.replaceAll('127.0.0.1', '10.0.2.2') ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.menu.name ?? 'Detail Menu'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 55,
          child: ElevatedButton.icon(
            onPressed: () {
              debugPrint('Pesan ${widget.menu.name} qty: $qty');
            },
            icon: const Icon(Icons.shopping_cart_checkout),
            label: const Text(
              'Pesan Sekarang',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              foregroundColor: Colors.black87,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Image.network(
            imageUrl,
            width: double.infinity,
            height: 280,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) {
              return Container(
                height: 280,
                color: Colors.grey.shade200,
                child: const Icon(Icons.image_not_supported, size: 50),
              );
            },
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.menu.name ?? '-',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  widget.menu.category ?? '-',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                ),

                const SizedBox(height: 16),

                Text(
                  'Rp ${widget.menu.price ?? '0'}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Deskripsi',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                Text(
                  widget.menu.description ?? '-',
                  style: TextStyle(color: Colors.grey.shade700, height: 1.5),
                ),

                const SizedBox(height: 24),

               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Jumlah Pesanan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Container(
                      height: 42,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            splashRadius: 20,
                            onPressed: qty > 1
                                ? () {
                                    setState(() {
                                      qty--;
                                    });
                                  }
                                : null,
                            icon: const Icon(Icons.remove, size: 20),
                          ),

                          SizedBox(
                            width: 30,
                            child: Center(
                              child: Text(
                                '$qty',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          IconButton(
                            splashRadius: 20,
                            onPressed: () {
                              setState(() {
                                qty++;
                              });
                            },
                            icon: const Icon(Icons.add, size: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
