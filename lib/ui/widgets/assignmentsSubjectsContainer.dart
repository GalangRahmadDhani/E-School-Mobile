import 'package:eschool/cubits/assignmentsCubit.dart';
import 'package:eschool/cubits/examsOnlineCubit.dart';
import 'package:eschool/cubits/resultsCubit.dart';
import 'package:eschool/data/models/subject.dart';
import 'package:eschool/utils/labelKeys.dart';
import 'package:eschool/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//It must be child of AssignmentsCibit
class AssignmentsSubjectContainer extends StatefulWidget {
  final List<Subject> subjects;
  final Function(int) onTapSubject;
  final int selectedClassSubjectId;
  final String cubitAndState;

  const AssignmentsSubjectContainer({
    Key? key,
    required this.subjects,
    required this.onTapSubject,
    required this.selectedClassSubjectId,
    required this.cubitAndState,
  }) : super(key: key);

  @override
  State<AssignmentsSubjectContainer> createState() =>
      _AssignmentsSubjectContainerState();
}

class _AssignmentsSubjectContainerState
    extends State<AssignmentsSubjectContainer> {
  late final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        controller: _scrollController,
        itemBuilder: (context, index) {
          final isSelected = widget.subjects[index].classSubjectId ==
              widget.selectedClassSubjectId;

          return GestureDetector(
            onTap: () {
              if (widget.cubitAndState == "onlineExam") {
                if (context.read<ExamsOnlineCubit>().state
                    is ExamsOnlineFetchInProgress) {
                  return;
                }
              } else if (widget.cubitAndState == "onlineResult") {
                // Change cubit later - according to Online Result
                if (context.read<ResultsCubit>().state
                    is ResultsFetchInProgress) {
                  return;
                }
              } else {
                if (context.read<AssignmentsCubit>().state
                    is AssignmentsFetchInProgress) {
                  return;
                }
              }

              if (widget.subjects[index].classSubjectId ==
                  widget.selectedClassSubjectId) {
                return;
              }

              final subjectIdIndex = widget.subjects.indexWhere(
                (element) =>
                    widget.subjects[index].classSubjectId ==
                    element.classSubjectId,
              );

              final selectedSubjectIdIndex = widget.subjects.indexWhere(
                (element) =>
                    widget.selectedClassSubjectId == element.classSubjectId,
              );

              _scrollController.animateTo(
                _scrollController.offset +
                    (subjectIdIndex > selectedSubjectIdIndex ? 1 : -1) *
                        MediaQuery.of(context).size.width *
                        (0.2),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );

              widget.onTapSubject(widget.subjects[index].classSubjectId ?? 0);
            },
            child: Container(
              margin: const EdgeInsetsDirectional.only(end: 20.0),
              decoration: BoxDecoration(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isSelected
                      ? Theme.of(context).scaffoldBackgroundColor
                      : Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                  width: 1.5, // Border width
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              child: Text(
                widget.subjects[index].classSubjectId == 0
                    ? Utils.getTranslatedLabel(context, allSubjectsKey)
                    : widget.subjects[index].getSubjectName(context: context) ?? 'No Name',
                style: TextStyle(
                  color: isSelected
                      ? Theme.of(context).scaffoldBackgroundColor
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          );
        },
        itemCount: widget.subjects.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * (0.1),
        ),
      ),
    );
  }
}
