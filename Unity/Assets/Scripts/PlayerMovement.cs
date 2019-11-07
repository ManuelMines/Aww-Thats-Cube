using UnityEngine;

public class PlayerMovement : MonoBehaviour {

    public Rigidbody rb;
    public GameManager gamemananger;
    public float forwardForce = 8000f;
    public float sidewayForce = 300f;
    public float resistance = 3f;
    public PlayerMovement movement;

    void Start()
    {
        Mathf.Clamp(rb.position.y, -100.0f, 0.5f);
    }
    // We marked this as "FixedUpdate"

    void FixedUpdate()
    {
        {
            rb.drag = resistance;
        }
      //  Debug.Log(player.forwardForce);
        //add a forward 
       {
       rb.AddForce(0, 0, forwardForce * Time.deltaTime);
       }

        rb.AddForce(Input.GetAxis("Horizontal") * sidewayForce * Time.deltaTime, 0, 0, ForceMode.VelocityChange);
        if (rb.position.y < -1f)
        {
            movement.enabled = false;
            gamemananger.EndGame();
        }
    }
       
}