using UnityEngine;

public class PlayerColision : MonoBehaviour {
    
    public PlayerMovement movement;
    public Rigidbody rb;



    void OnCollisionEnter (Collision collisionInfo)
    {
        if (collisionInfo.collider.tag == "Obstacle")
        {
            movement.enabled = false;
            FindObjectOfType<GameManager>().EndGame();
            FindObjectOfType<AudioManager>().Crashed();
        }

    }
}