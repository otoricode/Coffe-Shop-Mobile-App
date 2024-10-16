import 'package:flutter/material.dart';
import 'package:sstream/sstream.dart';

import 'package:app/common/styles/app_colors.dart';
import 'package:app/common/styles/border.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    super.key,
    required this.hint,
    this.type,
    this.label,
    required this.stream,
    this.labelColor,
    this.isEnabled = true,
    this.prefix,
    this.hintStyle,
    this.obsecureText = false,
  });

  final String hint;
  final TextInputType? type;
  final String? label;
  final SStream<String> stream;
  final Color? labelColor;
  final bool isEnabled;
  final Widget? prefix;
  final TextStyle? hintStyle;
  final bool obsecureText;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Text(
              widget.label ?? '',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
                color: widget.labelColor ?? AppColors.white,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
        ],
        StreamBuilder<String?>(
          stream: widget.stream.stream,
          initialData: widget.stream.value,
          builder: (context, snapshot) {
            final data = snapshot.data;
            _controller.value = _controller.value.copyWith(text: data);
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.grey.withOpacity(0.2),
                    AppColors.grey.withOpacity(0),
                  ],
                ),
                border: const Border(
                  top: BorderSide(
                    color: AppColors.glassmorphism,
                  ),
                  left: BorderSide(
                    color: AppColors.glassmorphism,
                  ),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextFormField(
                controller: _controller,
                obscureText: widget.obsecureText,
                onChanged: widget.stream.add,
                cursorWidth: 1,
                keyboardType: widget.type,
                cursorColor: AppColors.white,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
                decoration: CustomBorder.defaultInputDecoration.copyWith(
                  prefixIcon: widget.prefix,
                  enabled: widget.isEnabled,
                  hintText: widget.hint,
                  hintStyle: widget.hintStyle ??
                      Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.glassmorphism,
                          ),
                  errorText: snapshot.error?.toString(),
                  errorStyle: TextStyle(
                      color: Theme.of(context).colorScheme.error, fontSize: 10),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
