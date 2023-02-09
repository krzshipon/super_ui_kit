import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:super_ui_kit/super_ui_kit.dart';

import '../../home/note_model.dart';

class NoteCardView extends GetView {
  final Note note;
  final void Function()? ontap;
  final void Function(bool)? onHover;

  const NoteCardView(this.note, {this.ontap, this.onHover});

  @override
  Widget build(BuildContext context) {
    return CSCard(onTap: ontap, onHover: onHover, childrens: [
      IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 50),
                  color: Get.theme.colorScheme.primary,
                  child: Padding(
                    padding: EdgeInsets.only(left: 2),
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.book_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: CSText(
                            note.title ?? "",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: CSText(
                            'Author: ${note.author}',
                            textType: TextType.label,
                          )),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CSText('${note.desc}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textType: TextType.label),
                      ),
                      verticalSpaceTiny,
                      Row(
                        children: [
                          Icon(Icons.favorite_sharp, color: Get.theme.colorScheme.secondary,),
                          horizontalSpaceTiny,
                          CSText('${note.likeCount}+',
                              textType: TextType.label),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: CSText(
                                  DateFormat.yMMMd().format(
                                      (note.createDate as Timestamp).toDate()),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textType: TextType.label),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Icon(
                Icons.arrow_forward_sharp,
                color: Get.theme.colorScheme.primary,
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
