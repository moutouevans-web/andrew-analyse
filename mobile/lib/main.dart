
import 'package:flutter/material.dart';

void main() => runApp(const AndrewAnalyseApp());

const navy = Color(0xFF0B1630);
const panel = Color(0xFF142342);
const blue = Color(0xFF4C8DFF);
const muted = Color(0xFF9EABC4);

class AndrewAnalyseApp extends StatelessWidget {
  const AndrewAnalyseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Andrew Analyse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: navy,
        colorScheme: ColorScheme.fromSeed(
          seedColor: blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected = 0;

  final titles = ['Accueil', 'Matchs', 'Coupons', 'Historique'];
  final icons = [
    Icons.dashboard,
    Icons.sports_soccer,
    Icons.confirmation_number,
    Icons.history,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ANDREW ANALYSE',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: navy,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            if (selected == 0) ...[
              const Text(
                'Bienvenue 👋',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Le sport analysé par les statistiques.',
                style: TextStyle(color: muted),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2455A7), panel],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('CENTRE D’ANALYSE'),
                    SizedBox(height: 12),
                    Text(
                      'Des probabilités, pas des certitudes.',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Compare les statistiques, les cotes et les résultats.',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Nos modules',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              _tile(Icons.query_stats, 'Analyse des matchs',
                  'Statistiques et probabilités'),
              _tile(Icons.confirmation_number, 'Coupons',
                  'Sélections classées par fiabilité'),
              _tile(Icons.history, 'Historique',
                  'Suivi des réussites et des échecs'),
              const SizedBox(height: 12),
              const Text(
                'Prototype : les données réelles seront connectées à une prochaine étape.',
                style: TextStyle(color: muted, fontSize: 12),
              ),
            ] else ...[
              Icon(icons[selected], size: 48, color: blue),
              const SizedBox(height: 16),
              Text(
                titles[selected],
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                selected == 1
                    ? 'Les matchs et leurs statistiques seront affichés ici.'
                    : selected == 2
                        ? 'Les coupons seront créés à partir de données vérifiées.'
                        : 'Les pronostics et résultats vérifiés seront conservés ici.',
                style: const TextStyle(color: muted, height: 1.5),
              ),
              const SizedBox(height: 20),
              const Text(
                'Module en construction',
                style: TextStyle(color: blue, fontWeight: FontWeight.bold),
              ),
            ],
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF101D39),
        selectedIndex: selected,
        onDestinationSelected: (value) {
          setState(() => selected = value);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Accueil',
          ),
          NavigationDestination(
            icon: Icon(Icons.sports_soccer),
            label: 'Matchs',
          ),
          NavigationDestination(
            icon: Icon(Icons.confirmation_number_outlined),
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

  Widget _tile(IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: blue, size: 30),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: const TextStyle(color: muted, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: muted),
        ],
      ),
    );
  }
}
