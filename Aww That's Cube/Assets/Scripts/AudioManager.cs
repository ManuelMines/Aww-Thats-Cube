using UnityEngine.Audio;
using System;
using UnityEngine;

public class AudioManager : MonoBehaviour
{
    public Sound[] sounds;
    bool playerCrashed = false;
    bool win = false;

    // Start is called before the first frame update
    void Awake()
    {
        foreach (Sound s in sounds)
        {
            s.source = gameObject.AddComponent<AudioSource>();
            s.source.clip = s.clip;

            s.source.volume = s.volume;
            s.source.pitch = s.pitch;
            s.source.loop = s.loop;
        }
    }

    void Start()
    {
        // Play("sound that want to play");
    }

    public void Play(string name)
    {
        Sound s = Array.Find(sounds, sound => sound.name == name);
        if (s == null)
        {
            Debug.LogWarning("Sound: " + name + " not found");
            return;
        }
            s.source.Play();
            Debug.Log("crash");
    }

    public void Crashed()
    {
        if (playerCrashed == false)
        if (win == false)
        {
            playerCrashed = true;
            Debug.Log("audio manager crash");
            Play("crash");
        }
    }
        
    public void Win()
    {
        if (playerCrashed == false) 
            if (win == false) 
        {
                win = true;
        }
    }

}
