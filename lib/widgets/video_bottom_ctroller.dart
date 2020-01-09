import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../video.controller.dart';
import 'buffer_slider.dart';

class VideoBottomCtroller extends StatelessWidget {
  final VideoController controller;

  const VideoBottomCtroller({Key key, @required this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListTile(
      title: Row(
        children: <Widget>[
          Observer(
            builder: (_) => Text(
              controller.videoBoxTimeText,
              style: TextStyle(color: controller.color),
            ),
          ),
          Spacer(),
          Observer(
            builder: (_) => IconButton(
              icon: Icon(controller.volumeIcon),
              onPressed: controller.setOnSoundOrOff,
            ),
          ),
          Observer(
            builder: (_) => IconButton(
              icon: Icon(controller.fullScreenIcon),
              onPressed: (){
                controller.pause();
                controller.onFullScreen(context);
              }
            ),
          ),
        ],
      ),
      subtitle: Theme(
        data: theme.copyWith(
          sliderTheme: theme.sliderTheme.copyWith(
            trackHeight: 2, // line的高度
            overlayShape: SliderComponentShape.noOverlay,
            thumbShape: RoundSliderThumbShape(
              // 拇指的形状和大小
              enabledThumbRadius: 6.0,
            ),
          ),
        ),
        child: Observer(
          builder: (_) => BufferSlider(
            inactiveColor: controller.inactiveColor,
            bufferColor: controller.bufferColor,
            activeColor: controller.color,
            value: controller.sliderValue,
            bufferValue: controller.sliderBufferValue,
            onChanged: controller.sliderChanged,
          ),
        ),
      ),
    );
  }
}
