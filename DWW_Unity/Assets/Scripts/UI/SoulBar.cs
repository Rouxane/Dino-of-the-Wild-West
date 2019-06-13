using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SoulBar : MonoBehaviour
{

    // Update is called once per frame
    void Update()
    {
        transform.LookAt(transform.position + Camera.main.transform.forward, Camera.main.transform.up);
    }
}
