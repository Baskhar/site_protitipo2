
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:sistema_agendamento/pages/page_comprovante.dart';


class PageAgendamento extends StatefulWidget {
  PageAgendamento({Key? key, required this.nome_doutor}) : super(key: key);

  late String nome_doutor;

  @override
  State<PageAgendamento> createState() => _PageAgendamentoState();
}

class _PageAgendamentoState extends State<PageAgendamento> {
  final TextEditingController controllerCPF = TextEditingController();
  final TextEditingController controllerNOME = TextEditingController();
  final TextEditingController controllerNUMERO = TextEditingController();
  final TextEditingController controllerDATA = TextEditingController();
  final TextEditingController controllerHORARIO = TextEditingController();
  final formatdata = DateFormat("dd-MM-yyyy");
  final formathorario = DateFormat("hh:mm");
  final format = DateFormat("dd-MM-yyyy HH:mm");

  //final dropvalue = ValueNotifier('');
  //final dropOpcoes = ['Dr.João', 'Dr.Amanda', 'Dr.Antônio'];

  //final CollectionReference _clientes =
  //  FirebaseFirestore.instance.collection('odontolife');
  Future<QuerySnapshot>? posdocumentList;
  Future<QuerySnapshot>? snapshot;
  String userNametxt = '';
  int qt_data = 0;
  int qt_data2 = 0;
  int qt_data3 = 0;
  int qt_data4 = 0;
  int qt_data5 = 0;
  int qt_data6 = 0;
  int qt_data7 = 0;
  int qt_data8 = 0;
  int qt_data9 = 0;
  int qt_data10 = 0;
  int qt_data11 = 0;
  int qt_data12 = 0;
  int qt_data13 = 0;
  int qt_data14 = 0;
  int qt_data15 = 0;
  bool dr_joao_cheio = true;
  late String botao_horario;
  var dia;
  bool visivel = false;
  int teste = 0;
  final dropValor = ValueNotifier('');
  final dropatendimento = [
    'Manutenção',
    'Limpeza',
    'Mini Implante',
  ];
  String tipo_atendimento = '';
  final horarios = [
    '8H - 8:50HM',
    '8:50HM - 9:40HM',
    '9:40HM - 10:30HM',
    '8:00H - 8:30HM',
    '8:30HM - 9:00H',
    '9:00H - 9:30HM',
    '9:30HM - 10:00H',
    '10:00H - 10:30HM',
    '10:30HM - 11:00H',
    '14:00H - 14:50HM',
    '14:50HM - 15:40HM',
    '14:00H - 14:30HM',
    '14:30HM - 15:00H',
    '15:00H - 15:30HM',
    '15:30HM - 16:00H',
  ];

  GlobalKey<FormState> _formKey = GlobalKey<
      FormState>(); //instanciando um objeto que é a chave do meu formulário para validação
  initProcura(String txtEntered) {
    qt_data = 0;
    qt_data2 = 0;
    qt_data3 = 0;
    qt_data4 = 0;
    qt_data5 = 0;
    qt_data6 = 0;
    qt_data7 = 0;
    qt_data8 = 0;
    qt_data9 = 0;
    qt_data10 = 0;
    qt_data11 = 0;
    qt_data12 = 0;
    qt_data13 = 0;
    qt_data14 = 0;
    qt_data15 = 0;

    posdocumentList = FirebaseFirestore.instance
        .collection('odontolife')
        .where('data', isEqualTo: txtEntered)
        .get();
    setState(() {
      posdocumentList!.then((value) => value.docs.forEach((element) {
            print(element.data());
            if (element['horario'] == '8H - 8:50HM') {
              setState(() {
                qt_data += 1;
                /*
                qt_data2 += 1;
                qt_data3 += 1;
                qt_data4 += 1;
                qt_data5 += 1;
                qt_data6 += 1;
                qt_data7 += 1;
                qt_data8 += 1;
                qt_data9 += 1;*/
                // print(qt_data);
                if (qt_data > 1) {}
              });

              // print('Dr1: ${dr_joao_cheio}');
            }
            if (element['horario'] == '8:50HM - 9:40HM') {
              setState(() {
                qt_data2 += 1;
                //print(qt_data);
              });

              // print('Dr1: ${dr_joao_cheio}');
            }
            if (element['horario'] == '9:40HM - 10:30HM') {
              setState(() {
                qt_data3 += 1;
                // print(qt_data);
              });

              // print('Dr1: ${dr_joao_cheio}');
            }
            if (element['horario'] == '8:00H - 8:30HM') {
              setState(() {
                qt_data4 += 1;
                // print(qt_data);
              });

              // print('Dr1: ${dr_joao_cheio}');
            }
            if (element['horario'] == '8:30HM - 9:00H') {
              setState(() {
                qt_data5 += 1;
                // print(qt_data);
              });

              // print('Dr1: ${dr_joao_cheio}');
            }
            /*
            if (element['horario'] == '8:30HM - 9:00H') {
              setState(() {
                qt_data += 1;
                // print(qt_data);
              });

              // print('Dr1: ${dr_joao_cheio}');
            }

             */
            if (element['horario'] == '9:00H - 9:30HM') {
              setState(() {
                qt_data6 += 1;
                // print(qt_data);
              });

              // print('Dr1: ${dr_joao_cheio}');
            }
            if (element['horario'] == '9:30HM - 10:00H') {
              setState(() {
                qt_data7 += 1;
                // print(qt_data);
              });

              // print('Dr1: ${dr_joao_cheio}');
            }
            if (element['horario'] == '10:00H - 10:30HM') {
              setState(() {
                qt_data8 += 1;
                // print(qt_data);
              });

              // print('Dr1: ${dr_joao_cheio}');
            }
            if (element['horario'] == '10:30HM - 11:00H') {
              setState(() {
                qt_data9 += 1;
                // print(qt_data);
              });

              // print('Dr1: ${dr_joao_cheio}');
            }
            if (element['horario'] == '14:00H - 14:50HM') {
              setState(() {
                qt_data10 += 1;
                // print(qt_data);
              });

              // print('Dr1: ${dr_joao_cheio}');
            }
            if (element['horario'] == '14:50HM - 15:40HM') {
              setState(() {
                qt_data11 += 1;
                // print(qt_data);
              });

              // print('Dr1: ${dr_joao_cheio}');
            }
            if (element['horario'] == '14:00H - 14:30HM') {
              setState(() {
                qt_data12 += 1;
                // print(qt_data);
              });

              // print('Dr1: ${dr_joao_cheio}');
            }
            if (element['horario'] == '14:30HM - 15:00H') {
              setState(() {
                qt_data13 += 1;
                // print(qt_data);
              });

              // print('Dr1: ${dr_joao_cheio}');
            }
            if (element['horario'] == '15:00H - 15:30HM') {
              setState(() {
                qt_data14 += 1;
                // print(qt_data);
              });

              // print('Dr1: ${dr_joao_cheio}');
            }
            if (element['horario'] == '15:30HM - 16:00H') {
              setState(() {
                qt_data15 += 1;
                // print(qt_data);
              });

              // print('Dr1: ${dr_joao_cheio}');
            }

            teste += 1;
          }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Informe os seus dados"),
      ),
      body: Form(
        key: _formKey,
        //passando a chave que eu criei
        child: ListView(
          padding: EdgeInsets.all(32),
          children: [
            ValueListenableBuilder(
              valueListenable: dropValor,
              builder: (BuildContext contex, String value, _) {
                return DropdownButtonFormField<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(70),
                          borderSide: BorderSide(
                            color: Colors.yellow,
                          )),
                    ),
                    icon: Icon(Icons.accessibility_outlined),
                    hint: const Text('Selecione o Tipo de Atendimento'),
                    items: dropatendimento
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    value: (value.isEmpty) ? null : value,
                    onChanged: (escolha) {
                      dropValor.value = escolha.toString();
                      if (dropValor.value == 'Manutenção') {
                        tipo_atendimento = dropValor.value;
                      }
                      if (dropValor.value == 'Limpeza') {
                        tipo_atendimento = dropValor.value;
                      }
                      if (dropValor.value == 'Mini Implante') {
                        tipo_atendimento = dropValor.value;
                      }
                    });
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: controllerCPF,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "CPF",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(70))),
              validator: (value) {
                //validação através dessa função
                if (value!.isEmpty) {
                  return "Insira seu CPF";
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: controllerNOME,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "NOME",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(70))),
              validator: (value) {
                //validação através dessa função
                if (value!.isEmpty) {
                  return "Insira seu Nome";
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: controllerNUMERO,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "NÚMERO DE WHATSAPP",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(70))),
              validator: (value) {
                //validação através dessa função
                if (value!.isEmpty) {
                  return "Insira o seu número";
                }
              },
            ),

/*
            DateTimeField(
              format: formatdata,
              controller: controllerDATA,
              decoration: InputDecoration(labelText: "DATA E HORARIO"),
              onShowPicker: (context, currentValue) async {
                final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2022),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
                if (date != null) {
                  final time = await showTimePicker(
                    context: context,
                    initialTime:
                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                  );
                  return DateTimeField.combine(date, time);
                } else {
                  return currentValue;
                }
              },
            ),
*/
            SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 10,
            ),
            DateTimeField(
              decoration: InputDecoration(
                  labelText: "DATA",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(70))),
              format: formatdata,
              controller: controllerDATA,
              onChanged: (textEntered) {
                setState(() {
                  userNametxt = controllerDATA.text;
                  dia = textEntered!.weekday;
                  print('dia: $dia');
                  print(controllerDATA.text);
                  teste += 1;
                  print(teste);
                  print(tipo_atendimento);

                  //print('datetime(dr_joaocheio): ${dr_joao_cheio}');
                  // print('visivel: ${visivel}');
                });
                initProcura(controllerDATA.text);
              },
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(2022),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
              },
            ),
            /*
            DateTimeField(
              controller: controllerHORARIO,
              format: formathorario,
              decoration: InputDecoration(labelText: "Horário"),
              onShowPicker: (context, currentValue) async {
                final time = await showTimePicker(
                  context: context,
                  initialTime:
                  TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                return DateTimeField.convert(time);
              },
            ),
*/
            const SizedBox(
              height: 20,
            ),

/*
            Visibility(
              visible: tipo_atendimento == 'Manutenção',
              maintainState: true,
              maintainSize: true,
              maintainAnimation: true,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: horarios.length,
                  itemBuilder: (contex, index) {
                   // final horario = horarios[index];
                    return Card(
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            child: ListTile(
                              title: Text('8H às 8:50HM'),
                              onTap: (){
                              },
                              enabled: data1habilitado(),

                              /*
                              trailing: SizedBox(
                                width: 50,
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          if (qt_data > 0) {
                                            print('eeçiiiii');
                                            return null;
                                          } else {
                                            print(qt_data);
                                            print('oooooooiiiiiiiiiiii');
                                            botao_horario = '8H às 8:50HM';
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.green,
                                        ))
                                  ],
                                ),
                              ),*/
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),*/
            //VISIBILIDADE MANUTENÇÂO
            Visibility(
              maintainState: true,
              maintainAnimation: true,
              visible: tipo_atendimento == 'Manutenção',
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: ListTile.divideTiles(context: context, tiles: [
                        Card(
                          child: Flex(
                            direction: Axis.horizontal,
                            children: [
                              Flexible(
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text('8:00H - 8:30HM'),
                                      onTap: () {
                                        botao_horario = '8:00H - 8:30HM';
                                      },
                                      enabled: data4disponivel(),
                                    ),
                                    ListTile(
                                      title: Text('8:30HM - 9:00H'),
                                      onTap: () {
                                        botao_horario = '8:30HM - 9:00H';
                                      },
                                      enabled: data5disponivel(),
                                    ),
                                    ListTile(
                                      title: Text('9:00H - 9:30HM'),
                                      onTap: () {
                                        botao_horario = '9:00H - 9:30HM';
                                      },
                                      enabled: data6disponivel(),
                                    ),
                                    ListTile(
                                      title: Text('9:30HM - 10:00H'),
                                      onTap: () {
                                        botao_horario = '9:30HM - 10:00H';
                                      },
                                      enabled: data7disponivel(),
                                    ),
                                    ListTile(
                                      title: Text('10:00H - 10:30HM'),
                                      enabled: data8disponivel(),
                                      onTap: () {
                                        botao_horario = '10:00H - 10:30HM';
                                      },
                                    ),
                                    ListTile(
                                      title: Text('10:30HM - 11:00H'),
                                      onTap: () {
                                        botao_horario = '10:30HM - 11:00H';
                                      },
                                      enabled: data9disponivel(),
                                    ),
                                    ListTile(
                                      title: Text('14:00H - 14:30HM'),
                                      onTap: () {
                                        botao_horario = '14:00H - 14:30HM';
                                      },
                                      enabled: data12disponivel(),
                                    ),
                                    ListTile(
                                      title: Text('14:30HM - 15:00H'),
                                      onTap: () {
                                        botao_horario = '14:30HM - 15:00H';
                                      },
                                      enabled: data13disponivel(),
                                    ),
                                    ListTile(
                                      title: Text('15:00H - 15:30HM'),
                                      onTap: () {
                                        botao_horario = '15:00H - 15:30HM';
                                      },
                                      enabled: data14disponivel(),
                                    ),
                                    ListTile(
                                      title: Text('15:30HM - 16:00H'),
                                      onTap: () {
                                        botao_horario = '15:30HM - 16:00H';
                                      },
                                      enabled: data15disponivel(),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ]).toList(),
                    ),
                  ),
                ],
              ),
            ),
            //VISIBILIDADE Mini Implante e Limpeza
            Visibility(
              maintainState: true,
              maintainAnimation: true,
              visible: tipo_atendimento == 'Mini Implante' ||
                  tipo_atendimento == 'Limpeza',
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: ListTile.divideTiles(context: context, tiles: [
                        Card(
                          child: Flex(
                            direction: Axis.horizontal,
                            children: [
                              Flexible(
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text('8:00H - 8:50HM'),
                                      onTap: () {
                                        botao_horario = '8:00H - 8:50HM';
                                      },
                                      enabled: datadisponivel(),
                                    ),
                                    ListTile(
                                      title: Text('8:50HM - 9:40HM'),
                                      onTap: () {
                                        botao_horario = '8:50HM - 9:40HM';
                                      },
                                      enabled: data2disponivel(),
                                    ),
                                    ListTile(
                                      title: Text('9:40HM - 10:30HM'),
                                      onTap: () {
                                        botao_horario = '9:40HM - 10:30HM';
                                      },
                                      enabled: data3disponivel(),
                                    ),
                                    ListTile(
                                      title: Text('14:00H - 14:50HM'),
                                      onTap: () {
                                        botao_horario = '14:00H - 14:50HM';
                                      },
                                      enabled: data10disponivel(),
                                    ),
                                    ListTile(
                                      title: Text('14:50HM - 15:40HM'),
                                      enabled: data11disponivel(),
                                      onTap: () {
                                        botao_horario = '14:50HM - 15:40HM';
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ]).toList(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 64,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print(dr_joao_cheio);
                  print(qt_data);
                  createUser(
                      nome: controllerNOME.text,
                      cpf: controllerCPF.text,
                      numero: controllerNUMERO.text,
                      data: controllerDATA.text,
                      horario: botao_horario,
                      doutor: widget.nome_doutor);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PageComprovante(
                            nome_doutor: widget.nome_doutor,
                            data: controllerDATA.text,
                            horario: botao_horario,
                            nome: controllerNOME.text,
                            cpf: controllerCPF.text,
                            numero: controllerNUMERO.text,
                          )));
                }
              },
              child: Text("CONFIRMAR AGENDAMENTO"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              ),
            )
          ],
        ),
      ),
    );
  }

  //8:00H - 8:50HM
  bool datadisponivel() {
    if (qt_data > 0 ||
        teste == 0 ||
        dia == 7 ||
        dia == 2 ||
        dia == 4 ||
        qt_data4 > 0 ||
        qt_data5 > 0) {
      return false;
    } else {
      return true;
    }
  }

//8:50HM - 9:40HM
  bool data2disponivel() {
    if (qt_data2 > 0 ||
        teste == 0 ||
        dia == 7 ||
        dia == 2 ||
        dia == 4 ||
        qt_data6 > 0 ||
        qt_data7 > 0) {
      return false;
    } else {
      return true;
    }
  }

//9:40HM - 10:30HM
  bool data3disponivel() {
    if (qt_data3 > 0 ||
        teste == 0 ||
        dia == 7 ||
        dia == 2 ||
        dia == 4 ||
        qt_data7 > 0 ||
        qt_data8 > 0) {
      return false;
    } else {
      return true;
    }
  }

//8:00H - 8:30HM
  bool data4disponivel() {
    if (qt_data4 > 0 ||
        teste == 0 ||
        dia == 7 ||
        dia == 2 ||
        dia == 4 ||
        qt_data > 0) {
      return false;
    } else {
      return true;
    }
  }

//8:30HM - 9:00H
  bool data5disponivel() {
    if (qt_data5 > 0 ||
        teste == 0 ||
        dia == 7 ||
        dia == 2 ||
        dia == 4 ||
        qt_data > 0) {
      return false;
    } else {
      return true;
    }
  }

//9:00H - 9:30HM
  bool data6disponivel() {
    if (qt_data6 > 0 ||
        teste == 0 ||
        dia == 7 ||
        dia == 2 ||
        dia == 4 ||
        qt_data2 > 0) {
      return false;
    } else {
      return true;
    }
  }

//9:30HM - 10:00H
  bool data7disponivel() {
    if (qt_data7 > 0 ||
        teste == 0 ||
        dia == 7 ||
        dia == 2 ||
        dia == 4 ||
        qt_data2 > 0) {
      return false;
    } else {
      return true;
    }
  }

//10:00H - 10:30HM
  bool data8disponivel() {
    if (qt_data8 > 0 ||
        teste == 0 ||
        dia == 7 ||
        dia == 2 ||
        dia == 4 ||
        qt_data3 > 0) {
      return false;
    } else {
      return true;
    }
  }

//10:30HM - 11:00H
  bool data9disponivel() {
    if (qt_data9 > 0 || teste == 0 || dia == 7 || dia == 2 || dia == 4) {
      return false;
    } else {
      return true;
    }
  }

//14:00H - 14:50HM
  bool data10disponivel() {
    if (qt_data10 > 0 ||
        teste == 0 ||
        dia == 7 ||
        dia == 5 ||
        dia == 6 ||
        qt_data12 > 0 ||
        qt_data13 > 0) {
      return false;
    } else {
      return true;
    }
  }

//14:50HM - 15:40HM
  bool data11disponivel() {
    if (qt_data11 > 0 ||
        teste == 0 ||
        dia == 7 ||
        dia == 5 ||
        dia == 6 ||
        qt_data14 > 0) {
      return false;
    } else {
      return true;
    }
  }

//14:00H - 14:30HM
  bool data12disponivel() {
    if (qt_data12 > 0 ||
        dia == 5 ||
        dia == 6 ||
        teste == 0 ||
        dia == 7 ||
        qt_data10 > 0) {
      return false;
    } else {
      return true;
    }
  }

//14:30HM - 15:00H
  bool data13disponivel() {
    if (qt_data13 > 0 ||
        dia == 5 ||
        dia == 6 ||
        teste == 0 ||
        dia == 7 ||
        qt_data10 > 0) {
      return false;
    } else {
      return true;
    }
  }

//15:00H - 15:30HM
  bool data14disponivel() {
    if (qt_data14 > 0 ||
        dia == 5 ||
        dia == 6 ||
        teste == 0 ||
        dia == 7 ||
        qt_data11 > 0) {
      return false;
    } else {
      return true;
    }
  }

//15:30HM - 16:00H
  bool data15disponivel() {
    if (qt_data15 > 0 || dia == 5 || dia == 6 || teste == 0 || dia == 7) {
      return false;
    } else {
      return true;
    }
  }

  Future createUser({
    required String nome,
    required String cpf,
    required String numero,
    required String data,
    required String horario,
    required String doutor,
  }) async {
    //referencia do documento
    var db =
        FirebaseFirestore.instance; //instanciado a classe de coneção com o db
    //db.collection("odontolife").doc(controllerCPF.text);

    final json = {
      'nome': nome,
      'cpf': cpf,
      'número de whatsapp': numero,
      'data': data,
      'horario': horario,
      'doutor': doutor,
    };

    db.collection("odontolife").doc(controllerCPF.text).set(json);
  }
}

class User {
  late String cpf;
  late String nome;
  late int age;
  late DateTime data;

  User({
    this.cpf = '',
    required this.nome,
    required this.age,
    required this.data,
  });
/*
  verificarHorarios(){
    FutureBuilder<QuerySnapshot>(future: posdocu, builder: (context, snapshot){

    });
  }
*/

}
