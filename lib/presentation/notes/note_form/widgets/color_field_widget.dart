import 'package:ddd_to_do/application/notes/note_form/note_form_bloc.dart';
import 'package:ddd_to_do/domain/notes/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorField extends StatelessWidget {
  const ColorField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteFormBloc, NoteFormState>(
      buildWhen: (p, c) => p.note.color != c.note.color,
      builder: (context, state) {
        return SizedBox(
          // need height here to be able to use the ListView properly
          height: 80,
          // use separated here to get nice consistent spacing inbetween children
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            // makes it so that when you drag a list to either ends, it bounces back
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: NoteColor.predefinedColors.length,
            itemBuilder: (context, index) {
              final itemColor = NoteColor.predefinedColors[index];
              return GestureDetector(
                onTap: () {
                  // updates the state of the color
                  context.read<NoteFormBloc>().add(NoteFormEvent.colorChanged(itemColor));
                },
                child: Material(
                  color: itemColor,
                  elevation: 4,
                  // makes the widgets circular
                  shape: CircleBorder(
                    // makes it so that only the selected color is shaded in
                    // and the unselected colors aren't
                    side: state.note.color.value.fold(
                      (_) => BorderSide.none,
                      (color) => color == itemColor
                          ? const BorderSide(width: 3.5, color: Colors.white)
                          : BorderSide.none,
                    ),
                  ),
                  child: Container(
                    width: 50,
                    height: 50,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 12);
            },
          ),
        );
      },
    );
  }
}
