import 'package:flutter/material.dart';

class CircularButtonToggleWidget extends StatefulWidget {
  final String value;
  final List<dynamic> toggleButtonlist;
  final String defaultSelected;
  final Function toggleButtonOnChanged;
  final Color selectedButtonColor;
  final Color selectedTextColor;

  const CircularButtonToggleWidget({
    Key key,
    @required this.value,
    @required this.toggleButtonlist,
    @required this.toggleButtonOnChanged,
    this.defaultSelected,
    this.selectedButtonColor,
    this.selectedTextColor,
  }) : super(key: key);

  @override
  _CircularButtonToggleWidgetState createState() =>
      _CircularButtonToggleWidgetState();
}

class _CircularButtonToggleWidgetState
    extends State<CircularButtonToggleWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: List.generate(widget.toggleButtonlist.length, (index) {
        dynamic item = widget.toggleButtonlist[index];
        String itemname = '';
        itemname = item;
        final bool isActive = widget.value == itemname;
        return GestureDetector(
          onTap: () {
            if (!isActive) {
              widget.toggleButtonOnChanged(itemname);
            }
          },
          child: Container(
            margin: const EdgeInsets.only(right: 10, top: 6),
            padding: const EdgeInsets.fromLTRB(18, 6, 18, 6),
            decoration: BoxDecoration(
              color: isActive
                  ? Theme.of(context).primaryColorLight
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 1,
                color: isActive
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).dividerColor,
              ),
            ),
            child: Text(itemname.toString(),
                style: Theme.of(context).textTheme.headline2.copyWith(
                      fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                      color: isActive ? Theme.of(context).primaryColor : null,
                    ),
                key: Key(itemname.toString())),
          ),
        );
      }).toList(),
    );
  }
}
