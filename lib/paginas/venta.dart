import 'package:flutter/material.dart';

class CasasVentaPage extends StatelessWidget {
  const CasasVentaPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color azulPrimario = Color(0xFF0D47A1);
    const Color cafeMenu = Color(0xFF6D4C41);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text('Casas en Venta', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
              child: const Icon(Icons.search, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          _buildCard("Residencia Victoria", "\$3,450,000", "280m²", "Carlos Slim", "Zona Esmeralda #45", "https://images.unsplash.com/photo-1518780664697-55e3ad937233?q=80&w=400"),
          _buildCard("Mansión del Lago", "\$8,200,000", "500m²", "Brenda Ruiz", "Valle de Bravo, Sec. A", "https://images.unsplash.com/photo-1613490493576-7fde63acd811?q=80&w=400"),
        ],
      ),
    );
  }

  Widget _buildCard(String nombre, String precio, String med, String vend, String ubi, String url) {
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
              border: Border.all(color: const Color(0xFF1976D2).withValues(alpha: 0.5), width: 2),
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
                Text("Precio Venta: $precio", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                Text("Construcción: $med", style: const TextStyle(fontSize: 12)),
                Text("Agente: $vend", style: const TextStyle(fontSize: 12)),
                Text(ubi, style: const TextStyle(fontSize: 11, color: Colors.grey), overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
