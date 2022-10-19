import 'package:flutter/material.dart';

class PageComprovante extends StatefulWidget {
  PageComprovante(
      {Key? key,
      required this.nome_doutor,
      required this.data,
      required this.horario,
      required this.nome,
      required this.cpf,
      required this.numero})
      : super(key: key);
  late String nome_doutor;
  late String data;
  late String horario;
  late String cpf;
  late String nome;
  late String numero;

  @override
  State<PageComprovante> createState() => _PageComprovanteState();
}

class _PageComprovanteState extends State<PageComprovante> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green[900],
          title: Text("Agendamento Realizado!",style: TextStyle(
            color: Colors.white,
          ),),
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        //NOME
                        Flexible(
                          child: Row(
                            children: [
                              Text(
                                'Nome: ',
                                style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),
                              ),
                              Text(
                                '${widget.nome}',
                                style: TextStyle(color: Colors.deepOrange),

                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        //CPF
                        Flexible(
                          child: Row(
                            children: [
                              Text(
                                'CPF: ',
                                style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),
                              ),
                              Text(
                                '${widget.cpf}',
                                style: TextStyle(color: Colors.deepOrange),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        //WHATSAPP
                        Flexible(
                          child: Row(
                            children: [
                              Text(
                                'Whatsapp: ',
                                style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),
                              ),
                              Text(
                                '${widget.numero}',
                                style: TextStyle(color: Colors.deepOrange),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        //DOUTOR
                        Flexible(
                          child: Row(
                            children: [
                              Text(
                                'Doutor(a): ',
                                style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),
                              ),
                              Text(
                                '${widget.nome_doutor}',
                                style: TextStyle(color: Colors.deepOrange),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        //HORÁRIO
                        Flexible(
                          child: Row(
                            children: [
                              Text(
                                'Horário: ',
                                style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),
                              ),
                              Text(
                                '${widget.horario}',
                                style: TextStyle(color: Colors.deepOrange),
                              ),
                            ],
                          ),
                        ),

                        /*
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
                        )*/
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
