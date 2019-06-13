using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Audio;

public class Settings : MonoBehaviour
{
    public AudioMixer audioMixer;

    public void SetVolume(float Volume)
    {
        audioMixer.SetFloat("Volume", Volume);
    }

    public void SetFullScreen (bool isFullScreen)
    {
        Screen.fullScreen = isFullScreen;
    }
}
