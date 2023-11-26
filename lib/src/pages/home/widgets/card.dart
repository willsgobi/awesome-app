import 'package:awesome_app/src/models/item_model.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  final ToDo toDo;
  final VoidCallback delete;
  final String? Function(String? text) edit;
  const CardWidget(
      {super.key,
      required this.toDo,
      required this.delete,
      required this.edit});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  late TextEditingController inputController;

  @override
  void initState() {
    super.initState();
    inputController = TextEditingController(text: widget.toDo.text);
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: Colors.black.withOpacity(.2), width: 01))),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.toDo.text,
              maxLines: 2,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancelar"),
                        ),
                        TextButton(
                          onPressed: () {
                            widget.edit(inputController.text);
                          },
                          child: const Text(
                            "Salvar",
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      ],
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Atualizar item",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          TextFormField(
                            controller: inputController,
                            validator: (String? text) {
                              if (text == null) {
                                return "O campo não pode ser nulo.";
                              }

                              if (text.isEmpty) {
                                return "O campo não pode ser vazio";
                              }

                              return null;
                            },
                            decoration: const InputDecoration(),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.black,
              )),
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancelar"),
                        ),
                        TextButton(
                          onPressed: () {
                            widget.delete();
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Deletar",
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      ],
                      content: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Deseja realmente deletar este item?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Esta ação não poderá ser desfeita",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    );
                  });
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
