using UnityEngine;

public class FinishTrigger : MonoBehaviour
{
    public GameManager gamemananger;
    public AudioManager audiomanager;


    void OnTriggerEnter()
    {
        if (gamemananger.gameOver == false)
        {
            gamemananger.CompleteLevel();
            audiomanager.Win();
        }
    }
}