///Эта функция устанавливает для проигрывания мелодия. Если
///уже играет какая-то мелодия, то она остановится и начнется
///играть новая мелодия. Если в данный момент играет таже
///мелодия, которую вы попытались установить, то ничего не
///произойдет. Передаваемя в параметры мелодия будет играть до
///тех пор, пока вы ее не остановите при помощи функции StopMusicPlay().
///@param _music Музыка, которую в хотите
///включить для проигрывания
function SetMusicPlay(_music)
{
	if (!audio_is_playing(_music))
	{
		if (!audio_is_playing(global.CurrentPlayingMusic))
		{
			global.CurrentPlayingMusic = audio_play_sound(_music, 8, true, global.ValumeMusic);
			if (instance_exists(obj_button_showFullscreenAds))
				pause_music();
		}
		else
		{
			if (audio_is_paused(global.CurrentPlayingMusic))
			{
				StopMusicPlay();
				global.CurrentPlayingMusic = audio_play_sound(_music, 8, true, global.ValumeMusic);
				pause_music();
			}
			else
			{
				StopMusicPlay();
				global.CurrentPlayingMusic = audio_play_sound(_music, 8, true, global.ValumeMusic);
			}
		}
	}
}

///Эта функция останавливает мелодию, которая играет
///в данный момент.
function StopMusicPlay()
{
	audio_stop_sound(global.CurrentPlayingMusic);
	global.CurrentPlayingMusic = noone;
}

///Эта функция ставит на паузу музыку, которая в данный
///момент играет, если она не на паузе. И включает
///продолжение ее воспроизведения, если она на паузе.
function ModMusicPlay()
{
	if (!audio_is_paused(global.CurrentPlayingMusic))
	{
		audio_pause_sound(global.CurrentPlayingMusic);
	}
	else if (audio_is_paused(global.CurrentPlayingMusic))
	{
		audio_resume_sound(global.CurrentPlayingMusic);
	}
}

function pause_music()
{
	if (global.CurrentPlayingMusic == noone) return;

	if (!audio_is_paused(global.CurrentPlayingMusic))
	{
		audio_pause_sound(global.CurrentPlayingMusic);
	}
}

function unpause_music()
{
	if (global.CurrentPlayingMusic == noone) return;
	
	if (audio_is_paused(global.CurrentPlayingMusic))
	{
		audio_resume_sound(global.CurrentPlayingMusic);
	}
}

///Эта функция проигрывает звук один раз.
///@param _sound Звук, который вы хотите проиграть
function SetSoundPlay(_sound)
{
	global.CurrentPlayingSound = audio_play_sound(_sound, 10, false, global.ValumeSound);
}