#!/bin/sh
exec ffmpeg -hide_banner \
  -thread_queue_size 512 \
  -f v4l2 -video_size "${VIDEO_SIZE}" -framerate "${VIDEO_FRAMERATE}" -i "${VIDEO_DEVICE}" \
  -thread_queue_size 512 \
  -f alsa -channels "${AUDIO_CHANNELS}" -sample_rate "${AUDIO_SAMPLE_RATE}" -i "${AUDIO_DEVICE}" \
  -vf "format=yuv420p,drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf:text='%{localtime\:%F %T}':fontcolor=white:fontsize=14:x=10:y=h-th-10:box=1:boxcolor=black@0.5:boxborderw=5" \
  -c:v h264_v4l2m2m -g 50 -bf 0 \
  -c:a aac -b:a 128k \
  -f rtsp -rtsp_transport tcp rtsp://localhost:554/birdy
