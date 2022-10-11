import 'package:flutter/material.dart';

class PageComprovante extends StatefulWidget {
  PageComprovante(
      {Key? key,
      required this.nome_doutor,
      required this.data,
      required this.horario,
      required this.nome,
      required this.cpf})
      : super(key: key);
  late String nome_doutor;
  late String data;
  late String horario;
  late String cpf;
  late String nome;

  @override
  State<PageComprovante> createState() => _PageComprovanteState();
}

class _PageComprovanteState extends State<PageComprovante> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Agendamento Realizado Com Sucesso",
                        style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue,

                        ),
                      ),
                    ),
                    SizedBox(height: 50,),
                    Text(
                      "${widget.nome} que corresponde ao cpf:${widget.cpf} você foi agendado com o Doutor(a) ${widget.nome_doutor}, para o dia ${widget.data} no horário das ${widget.horario}",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
