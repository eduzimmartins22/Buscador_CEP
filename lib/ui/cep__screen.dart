import 'package:flutter/material.dart';
import '../controller/cep_controller.dart';
import '../dominio/buscar_cep.dart';

class CepSearchScreen extends StatefulWidget {
  const CepSearchScreen({super.key});

  @override
  State<CepSearchScreen> createState() => _CepSearchScreenState();
}

class _CepSearchScreenState extends State<CepSearchScreen> {
  final TextEditingController _textController = TextEditingController();
  late final CepController _controller;
  String _resultado = '';
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _controller = CepController(BuscarCepUseCase());
  }

  Future<void> _buscarCep() async {
    setState(() {
      _loading = true;
      _resultado = '';
    });

    final cep = _textController.text.trim();
    final resultado = await _controller.buscarCep(cep);

    setState(() {
      _loading = false;
      _resultado = resultado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buscar CEP')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Informe o CEP',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            if (_loading)
              const CircularProgressIndicator()
            else
              Text(
                _resultado,
                style: const TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _buscarCep,
        child: const Icon(Icons.search),
      ),
    );
  }
}
