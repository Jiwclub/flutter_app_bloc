import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController textController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                context.read<HomeBloc>().add(Increase());
              },
            ),
            const SizedBox(height: 4),
            FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () {
                context.read<HomeBloc>().add(Decrement());
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: BlocBuilder<HomeBloc, HomeInitial>(
                    builder: (context, state) {
                      return Center(child: Text("${state.counter}"));
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(9.0)),
                            borderSide: BorderSide(),
                          ),
                        ),
                        controller: textController,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<HomeBloc>()
                            .add(AddName(textController.text));
                        textController.clear();
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      child: const Text("ตกลง"),
                    )
                  ],
                ),
                BlocBuilder<HomeBloc, HomeInitial>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: state.nameList.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        final item = state.nameList[index];
                        return ListTile(
                          title: Text('${item['name']}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    _showDialogEdit(context, '${item['id']}');
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                  )),
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<HomeBloc>()
                                      .add(RemoveName('${item['id']}'));
                                },
                                icon: const Icon(
                                  Icons.delete,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> _showDialogEdit(
    BuildContext context,
    dynamic id,
  ) async {
    // final stateTest = context.watch<HomeInitial>();
    // log("stateTest ${stateTest.counter}");

    String nameEdit = '';
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text("titleName")),
          content: BlocBuilder<HomeBloc, HomeInitial>(
            builder: (context, state) {
              final item = state.nameList.where((e) => e['id'] == id).toList();
              nameEdit = item[0]['name'];
              return SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    SizedBox(
                      child: TextFormField(
                        initialValue: nameEdit,
                        onChanged: (value) => nameEdit = value,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                9.0,
                              ),
                            ),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          hintStyle: TextStyle(),
                          hintText: "",
                          contentPadding: EdgeInsets.only(left: 18, top: 8),
                        ),
                        textInputAction: TextInputAction.go,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('กลับ'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('ตกลง'),
              onPressed: () {
                context.read<HomeBloc>().add(EditName(nameEdit, '$id'));
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
