import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Providers/theme_provider.dart';
import 'Providers/counter_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Basic App'),
        centerTitle: true,
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return Switch(
                value: themeProvider.IsDark,
                onChanged: (value) => themeProvider.toggleTheme(),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (ctx, provider, child) {
            return Text('${provider.counter}', style: TextStyle(fontSize: 30));
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: .end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterProvider>().increment();
            },
            child: Icon(Icons.add, size: 20),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterProvider>().decrement();
            },
            child: Icon(Icons.remove, size: 20),
          ),
        ],
      ),
    );
  }
}
