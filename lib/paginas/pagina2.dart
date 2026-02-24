import 'package:flutter/material.dart';

class CasasRentaPage extends StatelessWidget {
  const CasasRentaPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color azulPrimario = Color(0xFF0D47A1);
    const Color cafeMenu = Color(0xFF6D4C41);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text('Casas en Renta', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: azulPrimario,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 50, height: 50,
              decoration: BoxDecoration(color: cafeMenu, borderRadius: BorderRadius.circular(10)),
              child: const Icon(Icons.tune, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          _buildCard("Residencial Los Olivos", "\$12,500", "\$10,000", "Juan Pérez", "Av. de la Raza #123", "https://images.unsplash.com/photo-1570129477492-45c003edd2be?q=80&w=400"),
          _buildCard("Villa del Sol", "\$8,900", "\$8,900", "Maria Garcia", "Col. Jardines, Calle 5", "https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?q=80&w=400"),
        ],
      ),
    );
  }

  Widget _buildCard(String nombre, String precio, String dep, String vend, String ubi, String url) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black12),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 5)],
      ),
      child: Row(
        children: [
          Container(
            width: 85, height: 85,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF0D47A1).withValues(alpha: 0.5), width: 2),
              image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.black, width: 1.5), borderRadius: BorderRadius.circular(5)),
                  child: Text(nombre, style: const TextStyle(color: Color(0xFF0D47A1), fontWeight: FontWeight.bold, fontSize: 13)),
                ),
                const SizedBox(height: 8),
                Text("Precio/mes: $precio", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                Text("Depósito: $dep", style: const TextStyle(fontSize: 12)),
                Text("Vendedor: $vend", style: const TextStyle(fontSize: 12)),
                Text(ubi, style: const TextStyle(fontSize: 11, color: Colors.grey), overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }
}