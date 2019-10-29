using UnityEngine;

public class FinishTrigger : MonoBehaviour
{
    public GameManager gamemananger;
    public AudioManager audiomanager;


    void OnTriggerEnter()
    {
        gamemananger.CompleteLevel();
        audiomanager.Win();
    }
}