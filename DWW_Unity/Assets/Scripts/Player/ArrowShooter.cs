using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ArrowShooter : MonoBehaviour
{
    void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            Arrow arrow = DataBaseManager.Instance.dataBase.arrow;
            if (arrow == null)
            {
                Debug.LogError("Missing Arrow Reference");
            }
            else
            {
                Arrow newArrow = Instantiate(arrow);
                newArrow.transform.position = transform.position;
                Rigidbody _rB = newArrow.GetComponent<Rigidbody>();
                _rB.velocity = Camera.main.transform.forward * 30;
            }
        }
    }
}
