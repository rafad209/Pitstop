import "package:flutter/material.dart";

class RoundButton extends StatefulWidget {
  final Icon icon;
  final Color color;
  final Function onPressed;
  @override
  _RoundButtonState createState() => _RoundButtonState();

  RoundButton({this.icon, this.color, this.onPressed});
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: FlatButton(
        color: widget.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: widget.icon,
        onPressed: widget.onPressed,
      ),
    );
  }
}
