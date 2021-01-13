import 'package:ddd_to_do/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UncompletedSwitch extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // similar to using bool showCheckMark = false in order to update the ui
    final toggleState = useState(false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      // using an InkResponse here to create an animation between checking and unchecking the box
      child: InkResponse(
        onTap: () {
          // similar to using showCheckMark = !showCheckMark in order to update the ui
          toggleState.value = !toggleState.value;
          // Tells the NoteWatcherBloc whether to show all the notes or only uncompleted notes
          context.read<NoteWatcherBloc>().add(
                toggleState.value
                    ? const NoteWatcherEvent.watchUncompletedStarted()
                    : const NoteWatcherEvent.watchAllStarted(),
              );
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: child,
          ),
          child: toggleState.value
              ? const Icon(
                  Icons.check_box_outline_blank,
                  // key is used here to tell flutter that a widget has been changed even though the type is the same
                  key: Key('outline'),
                )
              : const Icon(
                  Icons.indeterminate_check_box,
                  key: Key('indeterminate'),
                ),
        ),
      ),
    );
  }
}
