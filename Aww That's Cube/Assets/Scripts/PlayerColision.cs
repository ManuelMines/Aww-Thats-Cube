using UnityEngine;

public class PlayerColision : MonoBehaviour {
    
    public PlayerMovement movement;
    public Rigidbody rb;
    public PlayerMovement playermovement;
    public GameManager gamemananger;
    public AudioManager audiomanager;


    void OnCollisionEnter (Collision collisionInfo)
    {
        if (collisionInfo.collider.tag == "Obstacle")
        {
            playermovement.enabled = false;
            gamemananger.EndGame();
            audiomanager.Crashed();
        }

    }
}