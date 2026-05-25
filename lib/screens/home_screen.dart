import 'package:flutter/material.dart';

import '../widgets/action_card.dart';
import '../widgets/app_menu_drawer.dart';
import '../widgets/sobre_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const AppMenuDrawer(),
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
                      ActionCard(
                        title: 'Quer adotar um pet?',
                        description:
                            'Venha conhecer nossos bichinhos disponíveis.',
                      ),
                      SizedBox(height: 16),
                      ActionCard(
                        title: 'Deseja doar um pet?',
                        description:
                            'Clique aqui e coloque um animalzinho para adoção.',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SobreSection(),
          ],
        ),
      ),
    );
  }
}
