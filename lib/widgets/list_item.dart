import 'package:clone_app/widgets/comment_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final String image;

  const ListItem({super.key, required this.image});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network("https:${widget.image}", width: MediaQuery.of(context).size.width, fit: BoxFit.contain,),
          const SizedBox(height: 10.0,),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  icon: isLiked ? const Icon(Icons.favorite, color: Colors.red,) : const Icon(Icons.favorite_border_outlined)
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: IconButton(
                      onPressed: () {
                        CommentBottomSheet().commentBottomSheet(context);
                      },
                      icon: const Icon(Icons.chat_bubble_outline_outlined)
                  )
              )
            ],
          ),
          const SizedBox(height: 10.0,)
        ],
      ),
    );
  }
}
