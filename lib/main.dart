import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adota Rec',

      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // MENU LATERAL — abre pela direita
      endDrawer: const _AppMenuDrawer(),






      // HEADER — fundo branco; logo à esquerda, menu à direita
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.black26,
        scrolledUnderElevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        automaticallyImplyLeading: false,
        leadingWidth: 200,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'assets/images/logo_2.png',
              height: 56,
              fit: BoxFit.contain,
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.menu,
                color: Color(0xFFFF751F),
                size: 32,
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),

      // BODY (CORPO)
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                children: [
              Text.rich(
                textAlign: TextAlign.center,
                const TextSpan(
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 22,
                    height: 1.5,
                    color: Color(0xFF006DA6),
                  ),
                  children: [
                    TextSpan(
                      text: 'Adotar',
                      style: TextStyle(
                        color: Color(0xFFFF751F),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: ' um animal é um ato de ',
                    ),
                    TextSpan(
                      text: 'amor',
                      style: TextStyle(
                        color: Color(0xFFFF751F),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text:
                          ' que salva vidas. Muitos animalzinhos esperam a chance de ter um lar. Ao ',
                    ),
                    TextSpan(
                      text: 'adotar',
                      style: TextStyle(
                        color: Color(0xFFFF751F),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: ', você ganha um ',
                    ),
                    TextSpan(
                      text: 'amigo',
                      style: TextStyle(
                        color: Color(0xFFFF751F),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: ' fiel.',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 560),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Color(0xFFFF751F),
                    width: 3,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Image.asset(
                    'assets/images/home_foto.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 32),
                  const Column(
                    children: [
                      _ActionCard(
                        title: 'Quer adotar um pet?',
                        description:
                            'Venha conhecer nossos bichinhos disponíveis.',
                      ),
                      SizedBox(height: 16),
                      _ActionCard(
                        title: 'Deseja doar um pet?',
                        description:
                            'Clique aqui e coloque um animalzinho para adoção.',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const _SobreSection(),
          ],
        ),
      ),
     );
  }
}

class _AppMenuDrawer extends StatelessWidget {
  const _AppMenuDrawer();

  static const _blue = Color(0xFF006DA6);
  static const _orange = Color(0xFFFF751F);

  static ButtonStyle _navButtonStyle(BuildContext context) {
    return TextButton.styleFrom(
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      alignment: Alignment.centerLeft,
      foregroundColor: Colors.grey.shade500,
      textStyle: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static ButtonStyle _actionButtonStyle({
    required Color backgroundColor,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: Colors.white,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                style: _navButtonStyle(context),
                child: const Text('Home'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () => Navigator.pop(context),
                style: _navButtonStyle(context),
                child: const Text('Pets'),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: _actionButtonStyle(backgroundColor: _blue),
                  child: const Text('Entrar'),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: _actionButtonStyle(backgroundColor: _orange),
                  child: const Text('Quero adotar!'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SobreSection extends StatelessWidget {
  const _SobreSection();

  static const _blue = Color(0xFF006DA6);
  static const _orange = Color(0xFFFF751F);

  static const _highlight = TextStyle(color: _orange);

  @override
  Widget build(BuildContext context) {
    const imageRadius = 12.0;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            _blue,
            _blue.withValues(alpha: 0.5),
          ],
          stops: const [0.6, 1.0],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'SOBRE',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text.rich(
              textAlign: TextAlign.justify,
              const TextSpan(
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.white,
                ),
                children: [
                  TextSpan(text: 'O AdotaRec é uma '),
                  TextSpan(text: 'plataforma', style: _highlight),
                  TextSpan(
                    text:
                        ' que conecta animais a lares responsáveis, permitindo que ONGs e protetores cadastrem pets para ampliar suas chances de ',
                  ),
                  TextSpan(text: 'adoção.', style: _highlight),
                  TextSpan(
                    text:
                        ' Unindo tecnologia e empatia, o projeto também traz o ',
                  ),
                  TextSpan(text: 'PETKIDS,', style: _highlight),
                  TextSpan(text: ' um '),
                  TextSpan(text: 'game 3D', style: _highlight),
                  TextSpan(text: ' onde crianças simulam os '),
                  TextSpan(text: 'cuidados', style: _highlight),
                  TextSpan(
                    text:
                        ' com um animal, ajudando pais a avaliarem a maturidade dos filhos antes de uma adoção real. É a tecnologia a serviço da ',
                  ),
                  TextSpan(text: 'adoção consciente.', style: _highlight),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(imageRadius),
                border: Border.all(color: _orange, width: 3),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(imageRadius - 3),
                child: Image.asset(
                  'assets/images/5-cuidados-para-quem-tem-ou-pretende-adotar-um-gato.jpg',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  static const _orange = Color(0xFFFF751F);
  static const _blue = Color(0xFF006DA6);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: _blue, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: _orange,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 16,
                height: 1.4,
                color: _blue,
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: _orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  textStyle: const TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                child: const Text('Acesse'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

