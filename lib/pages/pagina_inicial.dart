import 'package:flutter/material.dart';
import 'package:sistema_agendamento/pages/page_agendamento.dart';



class PaginaInicial extends StatefulWidget {
  const PaginaInicial({Key? key}) : super(key: key);

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {

  final dropvalue = ValueNotifier('');
  final dropOpcoes = ['Dr.João', 'Dr.Amanda', 'Dr.Antônio'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Agendamento de consulta'),

      ),
      body: ValueListenableBuilder(
          valueListenable: dropvalue,
          builder: (BuildContext contex, String value, _) {
            return Center(
              child: DropdownButton<String>(
                hint: const Text('Selecione o Doutor(a)'),
                value: (value.isEmpty) ? null : value,
                onChanged: (escolha) {
                  dropvalue.value = escolha.toString();
                  if(dropvalue.value=='Dr.João'){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageAgendamento(nome_doutor:  dropvalue.value),));
                  }
                },
                items: dropOpcoes
                    .map(
                      (op) => DropdownMenuItem(
                    child: Text(op),
                    value: op,
                  ),
                )
                    .toList(),
              ),
            );

          }),
    );
  }
}