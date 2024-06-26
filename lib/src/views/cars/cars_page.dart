import 'package:cars/src/core/extensions/currency_extension.dart';
import 'package:cars/src/views/cars/store/cars_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CarsPage extends StatefulWidget {
  const CarsPage({
    required this.store,
    super.key,
  });

  final CarsStore store;

  @override
  State<CarsPage> createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  void dispose() {
    widget.store.stopRunning();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Carros Disponíveis',
          style: theme.textTheme.titleLarge?.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Observer(
          builder: (context) {
            if (widget.store.cars.isEmpty) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox.square(
                    dimension: 24,
                    child: CircularProgressIndicator(),
                  ),
                  SizedBox(height: 4),
                  Text('Carregando...'),
                ],
              );
            }

            return ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              separatorBuilder: (context, index) => const Divider(
                indent: 16,
                endIndent: 16,
              ),
              itemCount: widget.store.cars.length,
              itemBuilder: (context, index) {
                final car = widget.store.cars.elementAt(index);
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(car.nomeModelo),
                            const Spacer(),
                            Text("Ano: ${car.ano}"),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(car.cor),
                            const Spacer(),
                            Text("Combustível: ${car.combustivel}"),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text("${car.numPortas} portas"),
                            const Spacer(),
                            Text("Preço: ${car.valor.toCurrency}"),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            showSnackBar('Obrigado pelo seu'
                                ' interesse!\nEntraremos em contato em breve.');
                            widget.store.saveLead(car).ignore();
                          },
                          child: const Text('Eu quero'),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
        ),
      ),
    );
  }
}
