import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentBottomSheet {
  void commentBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        useSafeArea: true,
        builder: (BuildContext bc) {
          return const CommentBottomSheetWidget();
        }
    );
  }
}

class CommentBottomSheetWidget extends StatefulWidget {
  const CommentBottomSheetWidget({super.key});

  @override
  State<CommentBottomSheetWidget> createState() => _CommentBottomSheetWidgetState();
}

class _CommentBottomSheetWidgetState extends State<CommentBottomSheetWidget> {
  final _commentTextController = TextEditingController();
  final List<String> commentsList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
      height: MediaQuery.of(context).size.height * 0.89,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0)
        ),
        color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _commentTextController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Comments",
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      commentsList.add(_commentTextController.text);
                      _commentTextController.clear();
                    });
                  },
                  icon: Icon(Icons.add)
              )
            ),
            maxLines: 5,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(commentsList.length, (index) {
                  return Column(
                    children: [
                      Align(
                          child: Text(commentsList[index]),
                        alignment: Alignment.topLeft,
                      ),
                      Divider()
                    ],
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
