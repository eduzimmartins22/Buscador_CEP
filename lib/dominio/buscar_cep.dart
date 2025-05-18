import 'dart:convert';
import 'package:http/http.dart' as http;

class BuscarCepUseCase {
  Future<String> execute(String cep) async {
    final url = Uri.parse('https://viacep.com.br/ws/$cep/json/');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data.containsKey('erro')) {
        return 'CEP não encontrado.';
      }

      return '${data['logradouro']}, ${data['bairro']} - ${data['localidade']}/${data['uf']}';
    } else {
      return 'Erro na consulta do CEP.';
    }
  }
}
