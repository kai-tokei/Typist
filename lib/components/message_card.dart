import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  const MessageCard(
      {super.key,
      required this.label,
      required this.overview,
      required this.edit,
      required this.trash});

  final String label;
  final String overview;
  final VoidCallback edit;
  final VoidCallback trash;

  final TextStyle labelTextStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );

  final TextStyle overviewTextStyle = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 10,
  );

  final Icon editIcon = const Icon(
    Icons.create_outlined,
    size: 32,
  );

  final Icon trashIcon = const Icon(
    Icons.delete_outline,
    size: 32,
    color: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      child: InkWell(
          onTap: edit,
          child: Container(
              height: 84,
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(label,
                            overflow: TextOverflow.ellipsis,
                            style: labelTextStyle),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(overview,
                            overflow: TextOverflow.ellipsis,
                            style: overviewTextStyle),
                      ),
                    ],
                  )),
                  const Expanded(flex: 0, child: SizedBox()),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: editIcon,
                    onPressed: edit,
                  ),
                  IconButton(
                    icon: trashIcon,
                    onPressed: trash,
                  ),
                ],
              ))),
    );
  }
}
