
import 'package:flutter/material.dart';

void main() {
  runApp(const AndrewAnalyseApp());
}

const navy = Color(0xFF0B1530);
const blue = Color(0xFF246BFD);
const panel = Color(0xFF162342);

class AndrewAnalyseApp extends StatelessWidget {
  const AndrewAnalyseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Andrew Analyse',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: navy,
        colorScheme: ColorScheme.fromSeed(
          seedColor: blue,
          brightness: Brightness.dark,
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final pages = const [
    HomePage(),
    MatchesPage(),
    CouponsPage(),
    HistoryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navy,
        title: const Text(
          'ANDREW ANALYSE',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: const Icon(Icons.insights, color: Colors.blueAccent),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        backgroundColor: panel,
        indicatorColor: blue.withOpacity(0.25),
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Accueil',
          ),
          NavigationDestination(
            icon: Icon(Icons.sports_soccer),
            label: 'Matchs',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long),
            label: 'Coupons',
          ),
          NavigationDestination(
            icon: Icon(Icons.history),
            label: 'Historique',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const Text(
          'Bienvenue sur Andrew Analyse',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Des analyses fondées sur les statistiques, '
          'pas sur des certitudes.',
          style: TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 22),
        const InfoCard(
          icon: Icons.sports_soccer,
          title: 'Analyse des matchs',
          description: 'Prépare les rencontres et étudie les statistiques.',
        ),
        const InfoCard(
          icon: Icons.analytics_outlined,
          title: 'Probabilités',
          description: 'Les estimations seront séparées des données vérifiées.',
        ),
        const InfoCard(
          icon: Icons.receipt_long,
          title: 'Coupons',
          description: 'Retrouve les sélections et leur niveau de confiance.',
        ),
        const SizedBox(height: 12),
        const Text(
          'Version prototype : les données en direct ne sont pas encore '
          'connectées.',
          style: TextStyle(color: Colors.amber, fontSize: 12),
        ),
      ],
    );
  }
}

class MatchesPage extends StatelessWidget {
  const MatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const Text(
          'Matchs',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Espace de préparation des analyses',
          style: TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 18),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: panel,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.info_outline, color: Colors.amber, size: 30),
              SizedBox(height: 12),
              Text(
                'Aucun match réel connecté',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Les rencontres et les statistiques réelles seront ajoutées '
                'après la connexion à une source de données. '
                'Aucun match fictif ne sera présenté comme réel.',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        const Text(
          'Données prévues pour chaque match',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        const InfoCard(
          icon: Icons.event,
          title: 'Calendrier',
          description: 'Compétition, équipes, date et heure du match.',
        ),
        const InfoCard(
          icon: Icons.bar_chart,
          title: 'Statistiques',
          description: 'Forme récente, buts, tirs et corners disponibles.',
        ),
        const InfoCard(
          icon: Icons.calculate_outlined,
          title: 'Probabilités',
          description: 'Estimations à calculer lorsque les données seront '
              'suffisantes.',
        ),
      ],
    );
  }
}

class CouponsPage extends StatelessWidget {
  const CouponsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPage(
      icon: Icons.receipt_long,
      title: 'Coupons',
      message: 'Les coupons seront créés à partir des analyses validées.',
    );
  }
}

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPage(
      icon: Icons.history,
      title: 'Historique',
      message: 'Les pronostics seront enregistrés pour mesurer les réussites '
          'et les échecs après les matchs.',
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: panel,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Icon(icon, color: Colors.blueAccent, size: 30),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(description),
        ),
      ),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;

  const PlaceholderPage({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 52, color: Colors.blueAccent),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
