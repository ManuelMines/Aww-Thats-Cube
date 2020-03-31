using UnityEngine;

public class OnStartup : MonoBehaviour
{
    public GameObject MainMenu;
    public GameObject OptionsMenu;
    
    // Start is called before the first frame update
    void Start()
    {
        MainMenu.SetActive(true);
        OptionsMenu.SetActive(false);
    }
}
