import 'package:flutter/material.dart';
import 'package:mind_peace/presentation/widgets/feeling_button.dart';
import 'package:mind_peace/presentation/widgets/task_card.dart';

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Image.asset('assets/menu_burger.png'),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage('assets/profile.png'),
          ),
          SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back, Sabrina!",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'How are you feeling today ?',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 16,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FeelingButton(
                    label: 'Happy',
                    image: 'assets/happy.png',
                    color: Colors.pinkAccent,
                  ),
                  FeelingButton(
                    label: 'Calm',
                    image: 'assets/calm.png',
                    color: Colors.purple,
                  ),
                  FeelingButton(
                    label: 'Relax',
                    image: 'assets/relax.png',
                    color: Colors.orangeAccent,
                  ),
                  FeelingButton(
                    label: 'Focus',
                    image: 'assets/focus.png',
                    color: Colors.cyanAccent,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Today\'s task',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Column(
                children: [
                  TaskCard(
                    title: 'Morning',
                    description:
                        'Let\'s open up to the things that matter to people.',
                    color: Color(0x44FF0000),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TaskCard(
                    title: 'Noon',
                    description:
                        'Let\'s open up to the things that matter to people.',
                    color: Colors.orangeAccent,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TaskCard(
                    title: 'Evening',
                    description:
                        'Let\'s open up to the things that matter to people.',
                    color: Colors.greenAccent,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
