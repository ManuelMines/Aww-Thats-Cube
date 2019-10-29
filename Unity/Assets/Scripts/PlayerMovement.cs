using UnityEngine;

public class PlayerMovement : MonoBehaviour {

    public Rigidbody rb;
    public GameManager gamemananger;
    public float forwardForce = 2000f;
    public float sidewayForce = 1500f;
    public PlayerMovement movement;

    // We marked this as "FixedUpdate"
    void FixedUpdate()
    {
      //  Debug.Log(player.forwardForce);
        //add a forward 
       {
       rb.AddForce(0, 0, forwardForce * Time.deltaTime);
       }

         if ( Input.GetKey("d") )
       {
         rb.AddForce(sidewayForce * Time.deltaTime, 0, 0, ForceMode.VelocityChange);
       } 
       
              if (Input.GetKey("a") )
            {
              rb.AddForce(-sidewayForce * Time.deltaTime, 0, 0, ForceMode.VelocityChange);
            }
        if (rb.position.y < -1f)
        {
            movement.enabled = false;
            gamemananger.EndGame();
        }
    }
       
}
