import '../dominio/buscar_cep.dart';

class CepController {
  final BuscarCepUseCase _useCase;

  CepController(this._useCase);

  Future<String> buscarCep(String cep) async {
    return await _useCase.execute(cep);
  }
}
