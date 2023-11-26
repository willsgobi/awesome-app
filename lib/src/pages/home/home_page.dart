import 'package:awesome_app/src/pages/home/home_store.dart';
import 'package:awesome_app/src/pages/home/widgets/card.dart';
import 'package:awesome_app/src/pages/shared_widgets/privacy_policy.dart';
import 'package:awesome_app/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final toDoController = TextEditingController();
  final HomeStore homeStore = HomeStore();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    homeStore.getToDos();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  @override
  void dispose() {
    toDoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [darkBlue, aqua],
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 400,
                width: MediaQuery.sizeOf(context).width / 1.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
                child: Observer(
                  builder: (context) {
                    if (homeStore.toDos.isEmpty) {
                      return const Center(
                        child: Text(
                          "Não há dados a serem exibidos.",
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }

                    return ListView.builder(
                        itemCount: homeStore.toDos.length,
                        itemBuilder: (context, index) {
                          return Observer(
                            builder: (context) {
                              return CardWidget(
                                toDo: homeStore.toDos[index],
                                delete: () {
                                  homeStore.deleteToDo(index);
                                  FocusScope.of(context)
                                      .requestFocus(focusNode);
                                },
                                edit: (String? text) {
                                  if (text != null) {
                                    homeStore.edit(text, index);
                                    Navigator.of(context).pop();
                                  }
                                  return null;
                                },
                              );
                            },
                          );
                        });
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 1.3,
                child: TextField(
                  focusNode: focusNode,
                  controller: toDoController,
                  onSubmitted: (String? text) {
                    if (text != null && text.isNotEmpty) {
                      homeStore.addToDo(text);
                      toDoController.text = "";
                      FocusScope.of(context).requestFocus(focusNode);
                    } else {
                      FocusScope.of(context).requestFocus(focusNode);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("O campo deve ser preenchido"),
                        backgroundColor: Colors.red,
                      ));
                    }
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Digite seu texto",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const PrivacyPolicy()
            ],
          ),
        ),
      ),
    );
  }
}
