--------------------------------------------
-- Settings and social icons button effects
--------------------------------------------
display.setStatusBar(display.HiddenStatusBar)
local widget = require "widget"

local centerX = display.contentWidth * .5
local centerY = display.contentHeight * .5 

local isMscOn = true 
local isSfxOn
audio.reserveChannels(1) -- reserves two audio channels 

soundChanMusic = 1 -- reserve audio for channel 1, sfx will automatically play on the next channel

local soundPop = audio.loadSound("loudPopSfx.mp3")
local soundMusic = audio.loadStream("SneakySnitchST.mp3")

local function playSfx (event)
	if isMscOn then
		audio.play(soundMusic)
	end
end

local function playAudio()
	playSfx()
end

local function stopAudio()
	audio.stop()
	audio.rewind(soundMusic)
end

local function playPopSound()
	audio.play(soundPop)
end

local playMusicBtn = widget.newButton {
	label = "Play Music",
	width = 120,
	height = 68,
	onRelease = playAudio
}
playMusicBtn.x = centerX
playMusicBtn.y = 160

local stopMusicBtn = widget.newButton {
	label = "Stop Music",
	width = 120,
	height = 68,
	onRelease = stopAudio
}
stopMusicBtn.x = centerX
stopMusicBtn.y = centerY

local popSoundBtn = widget.newButton {
	label = "Pop",
	width = 120,
	height = 68,
	onEvent = playPopSound
}
popSoundBtn.x = centerX
popSoundBtn.y = 320







