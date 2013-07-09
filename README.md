triggerio-audio
===============

An iOS TriggerIO plugin for playing audio files with ducking. Ducking means that any existing background audio will dim out while the audio file plays, and dim back in once finished.

In this implementation, audio files are expected to be included in the project as resources, and the bundle should be renamed to "audio". I had an issue playing files in my `src` folder, so if you make that work I'd gladly accept a pull request.

Playing a file:
<pre>
forge.internal.call(
    'audio.play',
    'YOUR_AUDIO_FILE.m4a',
    function() {
        alert("Successfully playing audio file!");
    },
    function(error) {
        alert("Error playing audio file: " + JSON.stringify(e));
    }
);
</pre>

Listening for file to finish:
<pre>
forge.internal.addEventListener("audio.finishedPlaying", function () {
    alert("Finished playing audio file!");
});
</pre>

<pre>
Copyright (c) 2013, PumpUp Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met: 

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer. 
2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution. 

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

The views and conclusions contained in the software and documentation are those
of the authors and should not be interpreted as representing official policies, 
either expressed or implied, of the FreeBSD Project.
</pre>
