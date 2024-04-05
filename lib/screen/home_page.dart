import 'package:clone_app/screen/bloc/home_bloc.dart';
import 'package:clone_app/screen/bloc/home_events.dart';
import 'package:clone_app/screen/bloc/home_states.dart';
import 'package:clone_app/widgets/common_alert_dialog.dart';
import 'package:clone_app/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeBloc = HomeBloc();

  @override
  void initState() {
    _homeBloc.add(GetImages());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Clone App",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: BlocBuilder(
          bloc: _homeBloc,
          builder: (context, state) {
            if (state is GetImagesSuccess) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(state.imageDataList.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: ListItem(image: state.imageDataList[index].image!),
                    );
                  }),
                ),
              );
            }

            if(state is GetImagesFailure) {
              return CommonAlertDialog(message: state.error.message!, onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: ( BuildContext ctx ) =>HomePage() ));
              },);

            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
