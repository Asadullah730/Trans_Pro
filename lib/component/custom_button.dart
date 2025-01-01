import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final bool isLoading; // New parameter to indicate if loading state

  const CustomButton({
    Key? key,
    @required this.text,
    @required this.onPressed,
    this.isLoading = false, // Default value for isLoading is false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [Colors.orange, Colors.orange],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onPressed != null && !isLoading
              ? onPressed
              : null, // Disable button if isLoading is true

          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: isLoading
                  ? CircularProgressIndicator(
                      // Show loading indicator if isLoading is true
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : Text(
                      text!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
