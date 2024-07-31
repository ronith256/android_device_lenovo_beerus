#! /vendor/bin/sh

# Copyright (c) 2020, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

# d5p main mic
if [ $1 == "d5p_main_mic" ]
then
    setprop vendor.audio_factory.d5p_main_mic false
    echo 128000 > /sys/class/voicep/dbmdx/va_max_detection_buffer_size
    echo 0x31313 > /sys/class/voicep/dbmdx/usecase_manager
    echo va_ve > /sys/class/voicep/dbmdx/user_selected_chip
    echo reg=0x122 value=0x2 > /sys/class/voicep/dbmdx/direct_write
    echo 0x24 > /sys/class/voicep/dbmdx/usecase_manager
    sleep 6
    cat /dev/dbmdx-1 > /data/vendor/audio/d5p_main_mic.pcm
    setprop vendor.audio_factory.d5p_main_mic true

# d5p left mic
elif [ $1 == "d5p_left_mic" ]
then
    setprop vendor.audio_factory.d5p_left_mic false
    echo 128000 > /sys/class/voicep/dbmdx/va_max_detection_buffer_size
    echo 0x31313 > /sys/class/voicep/dbmdx/usecase_manager
    echo va_ve > /sys/class/voicep/dbmdx/user_selected_chip
    echo reg=0x122 value=0x1 > /sys/class/voicep/dbmdx/direct_write
    echo 0x24 > /sys/class/voicep/dbmdx/usecase_manager
    sleep 6
    cat /dev/dbmdx-1 > /data/vendor/audio/d5p_left_mic.pcm
    setprop vendor.audio_factory.d5p_left_mic true

elif [ $1 == "d5p_right_mic" ]
then
    setprop vendor.audio_factory.d5p_right_mic false
    echo 128000 > /sys/class/voicep/dbmdx/va_max_detection_buffer_size
    echo 0x31313 > /sys/class/voicep/dbmdx/usecase_manager
    echo va_ve > /sys/class/voicep/dbmdx/user_selected_chip
    echo reg=0x122 value=0x3 > /sys/class/voicep/dbmdx/direct_write
    echo 0x24 > /sys/class/voicep/dbmdx/usecase_manager
    sleep 6
    cat /dev/dbmdx-1 > /data/vendor/audio/d5p_right_mic.pcm
    setprop vendor.audio_factory.d5p_right_mic true

elif [ $1 == "ac108_left_channel" ]
then
    setprop vendor.audio_factory.ac108_left_channel false
    echo 128000 > /sys/class/voicep/dbmdx/va_max_detection_buffer_size
    echo 0x31313 > /sys/class/voicep/dbmdx/usecase_manager
    echo va_ve > /sys/class/voicep/dbmdx/user_selected_chip
    echo reg=0x122 value=0x5 > /sys/class/voicep/dbmdx/direct_write
    echo reg=0x10b value=0x011f > /sys/class/voicep/dbmdx/direct_write
    echo 0x24 > /sys/class/voicep/dbmdx/usecase_manager
    sleep 6
    cat /dev/dbmdx-1 > /data/vendor/audio/ac108_left_channel.pcm
    echo va_ve > /sys/class/voicep/dbmdx/user_selected_chip
    echo reg=0x10b value=0x0A00 > /sys/class/voicep/dbmdx/direct_write
    setprop vendor.audio_factory.ac108_left_channel true

elif [ $1 == "ac108_right_channel" ]
then
    setprop vendor.audio_factory.ac108_right_channel false
    echo 128000 > /sys/class/voicep/dbmdx/va_max_detection_buffer_size
    echo 0x31313 > /sys/class/voicep/dbmdx/usecase_manager
    echo va_ve > /sys/class/voicep/dbmdx/user_selected_chip
    echo reg=0x122 value=0x4 > /sys/class/voicep/dbmdx/direct_write
    echo reg=0x10b value=0x011f > /sys/class/voicep/dbmdx/direct_write
    echo 0x24 > /sys/class/voicep/dbmdx/usecase_manager
    sleep 6
    cat /dev/dbmdx-1 > /data/vendor/audio/ac108_right_channel.pcm
    echo va_ve > /sys/class/voicep/dbmdx/user_selected_chip
    echo reg=0x10b value=0x0A00 > /sys/class/voicep/dbmdx/direct_write
    setprop vendor.audio_factory.ac108_right_channel true

elif [ $1 == "tfa_calibration" ]
then
    /vendor/bin/climax -dsysfs -l /vendor/firmware/tfa98xx.cnt --resetMtpEx
    /vendor/bin/climax -dsysfs -l /vendor/firmware/tfa98xx.cnt --calibrate=once
    /vendor/bin/climax -dsysfs -l /vendor/firmware/tfa98xx.cnt --calshow > /data/vendor/audio/tfa_calibration_result
    chmod 644 /data/vendor/audio/tfa_calibration_result

fi
