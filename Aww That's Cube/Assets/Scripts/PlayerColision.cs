using UnityEngine;

public class PlayerColision : MonoBehaviour {
    
    public PlayerMovement movement;
    public Rigidbody rb;



    void OnCollisionEnter (Collision collisionInfo)
    {
        if (collisionInfo.collider.tag == "Obstacle")
        {
            GetComponent<PlayerMovement>().enabled = false;
            FindObjectOfType<GameManager>().EndGame();
            FindObjectOfType<AudioManager>().Crashed();
        }

    }
}