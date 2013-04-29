triggerio-audio
===============

An iOS TriggerIO plugin for playing audio files with ducking. Ducking means that any existing background audio will dim out while the audio file plays, and dim back in once finished.

In this implementation, audio files are expected to be included in the project as resources, and the bundle should be renamed to "audio". I had an issue playing files in my `src` folder, so if you make that work I'd gladly accept a pull request.

Playing a file:
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

Listening for file to finish:
forge.internal.addEventListener("audio.finishedPlaying", function () {
    alert("Finished playing audio file!");
});
