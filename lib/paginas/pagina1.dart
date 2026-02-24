import 'package:flutter/material.dart';
import 'pagina2.dart'; // Import para navegar a Renta
import 'pagina3.dart'; // Import para navegar a Venta

// Colores globales para mantener consistencia
const Color azulPrimario = Color(0xFF0D47A1);
const Color azulLlamativo = Color(0xFF1976D2);
const Color cafeMenu = Color(0xFF6D4C41);
const Color azulFondo = Color(0xFFF5F7FA);

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: azulFondo,
      appBar: AppBar(
        title: const Text('Inicio', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: azulPrimario,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(flex: 5, child: _buildMenuButton(context, "Vendedores", Icons.people, azulLlamativo, null)),
                  const SizedBox(width: 10),
                  Expanded(flex: 1, child: _buildBotonCafe()),
                ],
              ),
              _buildMenuButton(context, "Casas en venta", Icons.sell, azulLlamativo, const CasasVentaPage()),
              _buildMenuButton(context, "Casas en renta", Icons.key, azulLlamativo, const CasasRentaPage()),
              _buildMenuButton(context, "Contacto", Icons.contact_mail, azulLlamativo, null),
              _buildMenuButton(context, "Agendar cita", Icons.calendar_today, azulPrimario, null),
              const SizedBox(height: 50),
              const Center(
                child: Column(
                  children: [
                    Text("Yeyo Dwellings", style: TextStyle(color: azulPrimario, fontWeight: FontWeight.bold, fontSize: 20)),
                    SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image(
                        image: NetworkImage('https://images.unsplash.com/photo-1568605114967-8130f3a36994?q=80&w=500'),
                        width: 260, height: 180, fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String texto, IconData icono, Color color, Widget? destino) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: ElevatedButton.icon(
        onPressed: () {
          if (destino != null) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => destino));
          }
        },
        icon: Icon(icono, color: Colors.white),
        label: Text(texto, style: const TextStyle(color: Colors.white, fontSize: 16)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _buildBotonCafe() {
    return Container(
      height: 58,
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(color: cafeMenu, borderRadius: BorderRadius.circular(12)),
      child: PopupMenuButton<String>(
        icon: const Icon(Icons.more_vert, color: Colors.white),
        itemBuilder: (context) => [const PopupMenuItem(child: Text("Filtros"))],
      ),
    );
  }
}